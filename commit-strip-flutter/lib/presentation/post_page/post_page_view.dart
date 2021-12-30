import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:commit_strip/core/providers/favorites_bloc.dart';
import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/presentation.dart';
import 'package:commit_strip/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _Star extends StatelessWidget {
  final Post post;

  const _Star({ Key? key, required this.post })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFavorite = context
      .watch<FavoritesBloc>()
      .contains(post);

    return Star(isFavorite: isFavorite);
  }
}

class PostPageView extends StatefulWidget {
  final PostPageData data;
  final void Function(Post) toggleFavorite;
  final void Function(String) launch;
  final bool Function(Post) isFavorite;

  const PostPageView({
    Key? key,
    required this.data,
    required this.toggleFavorite,
    required this.launch,
    required this.isFavorite,
  })
    : super(key: key);

  @override
  State<PostPageView> createState() => _PostPageViewState();
}

class _PostPageViewState extends State<PostPageView>
  with TickerProviderStateMixin {
  late final _pageController =
    PageController(initialPage: widget.data.initialIndex);

  late final _currentPost =
    ValueNotifier(_posts[widget.data.initialIndex]);

  final _enabledSwipe = ValueNotifier(true);
  final _transformationController = TransformationController();

  late final _animation = AnimationController(
    vsync: this,
    duration: const Duration(microseconds: 300),
  );

  final _showBars = ValueNotifier(true);

  final _duration = const Duration(milliseconds: 300);
  final _curve = Curves.ease;

  List<Post> get _posts => widget.data.posts;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    final star = ValueListenableBuilder(
      valueListenable: _currentPost,
      builder: (_, Post post, __) =>
        _Star(post: post),
    );

    final appBar = AppBar(
      backgroundColor: Colors.black.withOpacity(0.5),
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const FaIcon(FontAwesomeIcons.longArrowAltLeft),
      ),
      actions: [
        IconButton(
          onPressed: _info,
          icon: const FaIcon(FontAwesomeIcons.info),
        ),
        IconButton(
          onPressed: _toggleFavorite,
          icon: star,
        ),
        /* IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.shareAlt),
        ), */
      ],
    );

    final animatedAppBar = PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: ValueListenableBuilder(
        valueListenable: _showBars,
        builder: (_, bool show, __) {
          final y = -1 * (kToolbarHeight + topPadding);

          final tween = Tween<double>(
            begin: show ? y : 0,
            end: show ? 0 : y,
          );

          return TweenAnimationBuilder<double>(
            duration: _duration,
            curve: _curve,
            tween: tween,
            child: appBar,
            builder: (_, y, child) {
              return Transform.translate(
                offset: Offset(0, y),
                child: child,
              );
            },
          );
        },
      ),
    );

    final pages = GestureDetector(
      onTap: _toggleControls,
      child: ValueListenableBuilder(
        valueListenable: _enabledSwipe,
        builder: (_, bool enabledSwipe, __) {
          return PageView.builder(
            physics:
              enabledSwipe ? null : const NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: _posts.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (_, index) {
              final post = widget.data.posts[index];

              return CachedNetworkImage(
                imageUrl: post.image,
                imageBuilder: (_, image) {
                  return InteractiveViewer(
                    transformationController: _transformationController,
                    onInteractionEnd: (_) {
                      final scale = _transformationController
                        .value.getMaxScaleOnAxis();

                      _enabledSwipe.value = scale == 1;
                    },
                    minScale: 1,
                    maxScale: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: image,
                          fit: BoxFit.contain,
                        )
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );

    final bottomBar = SizedBox(
      height: kBottomNavigationBarHeight,
      child: BottomAppBar(
        elevation: 0,
        color: Colors.black.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _previous,
              icon: const FaIcon(FontAwesomeIcons.chevronLeft),
            ),

            const SizedBox(width: 16),
            IconButton(
              onPressed: _random,
              icon: const FaIcon(FontAwesomeIcons.random),
            ),

            const SizedBox(width: 16),
            IconButton(
              onPressed: _next,
              icon: const FaIcon(FontAwesomeIcons.chevronRight),
            )
          ],
        ),
      ),
    );

    final animatedBottomBar = ValueListenableBuilder(
      valueListenable: _showBars,
      builder: (_, bool show, __) {
        const y = kBottomNavigationBarHeight;

        final tween = Tween<double>(
          begin: show ? y : 0,
          end: show ? 0 : y,
        );

        return TweenAnimationBuilder<double>(
          duration: _duration,
          curve: _curve,
          tween: tween,
          child: bottomBar,
          builder: (_, y, child) {
            return Transform.translate(
              offset: Offset(0, y),
              child: child,
            );
          },
        );
      },
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: animatedAppBar,
      body: pages,
      bottomNavigationBar: animatedBottomBar,
      extendBody: true,
      backgroundColor: Colors.black,
    );
  }

  void _onPageChanged(int index) =>
    _currentPost.value = _posts[index];
  
  void _info() {
    final post = _currentPost.value;
    final date = post.date.toLocal().toString();

    final t = locale(context);

    showModalBottomSheet(
      context: context,
      builder: (_) => Wrap(
        children: [
          ListTile(
            title: Text(t.title),
            subtitle: Text(post.title),
          ),
          ListTile(
            title: Text(t.publicationDate),
            subtitle: Text(date),
          ),
          ListTile(
            title: Text(t.link),
            subtitle: Text(
              post.url,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () => widget.launch(post.url),
            trailing: const FaIcon(FontAwesomeIcons.externalLinkAlt),
          ),
        ],
      ),
    );
  }

  void _previous() {
    _pageController.previousPage(
      duration: _duration,
      curve: _curve,
    );
  }

  void _next() {
    _pageController.nextPage(
      duration: _duration,
      curve: _curve,
    );
  }

  void _random() {
    final random = Random();
    final index = random.nextInt(_posts.length);

    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    super.dispose();
    _animation.dispose();
  }

  void _toggleControls() =>
    _showBars.value = !_showBars.value;

  void _toggleFavorite() {
    widget.toggleFavorite(_currentPost.value);
  }
}
