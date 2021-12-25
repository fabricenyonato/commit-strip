import 'package:commit_strip/core/providers/settings_bloc.dart';
import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/core/providers/favorites_bloc.dart';
import 'package:commit_strip/presentation/post_page/post_page_bloc.dart';
import 'package:commit_strip/presentation/post_page/post_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class PostPage extends StatelessWidget {
  const PostPage({ Key? key })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<PostPageBloc>();

    return PostPageView(
      data: bloc.state,
      toggleFavorite: (post) =>
        _toggleFavorite(context, post),
      launch: _launch,
      isFavorite: (post) => _isFavorite(context, post),
    );
  }

  void _toggleFavorite(BuildContext context, Post post) {
    final lang = context.read<SettingsBloc>().lang;
    final favoritesBloc = context.read<FavoritesBloc>();

    favoritesBloc.toggleFavorite(post, lang);
  }

  void _launch(String url) {
    launch(url);
  }

  bool _isFavorite(BuildContext context, Post post) =>
    context.read<FavoritesBloc>().contains(post);
}
