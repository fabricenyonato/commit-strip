import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/presentation.dart';
import 'package:commit_strip/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _LoadingView extends StatelessWidget {
  const _LoadingView({ Key? key })
    : super(key: key);

  @override
  Widget build(BuildContext context) =>
    ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: 5,
      itemBuilder: (_, index) =>
        const PostCardPlaceholder()
    );
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
  final void Function(String) changeLang;
  final VoidCallback refresh;

  const HomePageView({
    Key? key,
    required this.data,
    required this.onPostTap,
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
        )
      ],
    );

    final body = data.posts.when(
      loading: () => const _LoadingView(),
      error: (error) => _ErrorView(
        error: error,
        retry: refresh,
      ),
      success: (posts) => PostListView(
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
