import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/presentation.dart';
import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  final List<Post> posts;
  final void Function(Post) onPostTap;

  const PostListView({
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

        return PostCard(
          post: post,
          onTap: onPostTap,
        );
      },
    );
  }
}
