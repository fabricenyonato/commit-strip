import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/presentation.dart';
import 'package:commit_strip/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _NoDataView extends StatelessWidget {
  const _NoDataView({ Key? key })
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
            const FaIcon(FontAwesomeIcons.folderOpen),
            const SizedBox(height: 8),

            Text(
              t.noData,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FavoritesPageView extends StatelessWidget {
  final List<Post> posts;
  final void Function(Post) onPostTap;

  const FavoritesPageView({
    Key? key,
    required this.posts,
    required this.onPostTap,
  })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (posts.isEmpty) {
      return const _NoDataView();
    }

    return PostListView(
      posts: posts,
      onPostTap: onPostTap,
    );
  }
}
