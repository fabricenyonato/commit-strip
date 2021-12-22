import 'package:cached_network_image/cached_network_image.dart';
import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/presentation/post_page/post_page_data.dart';
import 'package:flutter/material.dart';

class PostPageView extends StatefulWidget {
  final PostPageData data;

  const PostPageView({
    Key? key,
    required this.data,
  })
    : super(key: key);

  @override
  State<PostPageView> createState() => _PostPageViewState();
}

class _PostPageViewState extends State<PostPageView> {
  late final PageController _pageController;
  late final ValueNotifier<Post> _currentPost;

  List<Post> get _posts => widget.data.posts;

  @override
  Widget build(BuildContext context) {
    final title = ValueListenableBuilder(
      valueListenable: _currentPost,
      builder: (_, Post post, __) =>
        Text(post.title)
    );

    final appBar = AppBar(
      title: title,
    );

    final pages = PageView.builder(
      controller: _pageController,
      itemCount: _posts.length,
      onPageChanged: _onPageChanged,
      itemBuilder: (_, index) {
        final post = widget.data.posts[index];

        return CachedNetworkImage(
          imageUrl: post.image,
          imageBuilder: (_, image) {
            return InteractiveViewer(
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

    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: pages,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: widget.data.initialIndex,
    );

    final post = _posts[widget.data.initialIndex];
    _currentPost = ValueNotifier(post);
  }

  void _onPageChanged(int index) =>
    _currentPost.value = _posts[index];
}
