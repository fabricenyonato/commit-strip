import 'package:cached_network_image/cached_network_image.dart';
import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/presentation/home_page/home_page_data.dart';
import 'package:commit_strip/presentation/widgets/star.dart';
import 'package:commit_strip/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const thumbnailRatio = 492 / 940;
const bottomBarHeightRatio = 18.9 / 100;
const logoWidthRatio = 20 / 100;

class _PostContainer extends StatelessWidget {
  final Widget Function(BuildContext, double, double) builder;
  final String? title;
  final VoidCallback? onTap;

  const _PostContainer({
    Key? key,
    required this.builder,
    this.title,
    this.onTap,
  })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 0,
        // horizontal: 16,
        // vertical: 8,
      ),
      child: LayoutBuilder(
        builder: (_, box) {
          final width = box.maxWidth;
          final height = width * thumbnailRatio;

          return SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                builder(context, width, height),
                _bottom(width, height),
              ],
            ),
          );
        }
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: child,
    );
  }

  Widget _bottom(double width, double height) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: height * bottomBarHeightRatio,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff1f1f1f),
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(8),
              //   bottomRight: Radius.circular(8),
              // ),
            ),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(width: 4),
              Image.asset(
                'assets/logo_small.png',
                width: width * logoWidthRatio,
              ),

              if (title != null) Expanded(
                child: Container(
                  height: 35,
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      ],
    );
  }
}

class _PostPlaceholder extends StatelessWidget {
  const _PostPlaceholder({ Key? key })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PostContainer(
      builder: (_, width, height) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade600,
          // borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class _Post extends StatelessWidget {
  final Post post;
  final void Function(Post) onTap;

  const _Post({
    Key? key,
    required this.post,
    required this.onTap,
  })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    const placeholder = _PostPlaceholder();

    return CachedNetworkImage(
      imageUrl: post.thumbnail ?? 'https://www.commitstrip.com/wp-content/uploads/2021/12/HeadlineImageTemplate-.jpg',
      placeholder: (_, __) => placeholder,
      errorWidget: (_, __, ___) => placeholder,
      imageBuilder: (_, image) => _PostContainer(
        onTap: () => onTap(post),
        title: post.title,
        builder: (_, width, height) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
              image: image,
              fit: BoxFit.fill,
            ),
            // borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView({ Key? key })
    : super(key: key);

  @override
  Widget build(BuildContext context) =>
    ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: 5,
      itemBuilder: (_, index) =>
        const _PostPlaceholder()
    );
}

class _SuccessView extends StatelessWidget {
  final List<Post> posts;
  final void Function(Post) onPostTap;

  const _SuccessView({
    Key? key,
    required this.posts,
    required this.onPostTap,
  })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: posts.length,
      itemBuilder: (_, index) {
        final post = posts[index];

        return _Post(
          post: post,
          onTap: onPostTap,
        );
      },
    );
  }
}

class _ErrorView extends StatelessWidget {
  final Object error;
  final VoidCallback retry;

  const _ErrorView({
    Key? key,
    required this.error,
    required this.retry,
  })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = locale(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FaIcon(FontAwesomeIcons.exclamationTriangle),
            const SizedBox(height: 16),

            Text(
              t.errorTitile,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 8),
            Text(
              t.errorDescription,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: retry,
              child: Text(t.retry),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageView extends StatelessWidget {
  final HomePageData data;
  final void Function(Post) onPostTap;
  final void Function() toggleFavorites;
  final void Function(String) changeLang;
  final VoidCallback refresh;

  const HomePageView({
    Key? key,
    required this.data,
    required this.onPostTap,
    required this.toggleFavorites,
    required this.changeLang,
    required this.refresh,
  })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Image.asset('assets/logo.png'),
      actions: [
        IconButton(
          onPressed: () => _langs(context),
          icon: const FaIcon(FontAwesomeIcons.language),
        ),
        IconButton(
          onPressed: toggleFavorites,
          icon: Star(isFavorite: data.isFavorites),
        ),
      ],
    );

    final body = data.posts.when(
      loading: () => const _LoadingView(),
      error: (error) => _ErrorView(
        error: error,
        retry: refresh,
      ),
      success: (posts) => _SuccessView(
        posts: posts,
        onPostTap: onPostTap,
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }

  void _langs(BuildContext context) async {
    const langs = [
      { 'label': 'English', 'code': 'en' },
      { 'label': 'Français', 'code': 'fr' },
    ];

    final code = await showModalBottomSheet<String>(
      context: context,
      builder: (_) => Wrap(
        children: [
          for (final lang in langs)
            ListTile(
              title: Text(lang['label']!),
              onTap: () => Navigator.pop(context, lang['code']!),
            ),
        ],
      ),
    );

    if (code == null) return;

    changeLang(code);
  }
}
