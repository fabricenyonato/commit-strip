import 'package:cached_network_image/cached_network_image.dart';
import 'package:commit_strip/domain/entities/post.dart';
import 'package:flutter/material.dart';

const _thumbnailRatio = 492 / 940;
const _bottomBarHeightRatio = 18.9 / 100;
const _logoWidthRatio = 20 / 100;

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
          final height = width * _thumbnailRatio;

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
            height: height * _bottomBarHeightRatio,
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
                width: width * _logoWidthRatio,
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

class PostCardPlaceholder extends StatelessWidget {
  const PostCardPlaceholder({ Key? key })
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

class PostCard extends StatelessWidget {
  final Post post;
  final void Function(Post) onTap;

  const PostCard({
    Key? key,
    required this.post,
    required this.onTap,
  })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    const placeholder = PostCardPlaceholder();

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