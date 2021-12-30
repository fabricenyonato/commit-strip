import 'package:commit_strip/core/providers/favorites_bloc.dart';
import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/presentation.dart';
import 'package:commit_strip/core/providers/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageBloc = context.watch<HomePageBloc>();

    return HomePageView(
      data: homePageBloc.state,
      onPostTap: (post) => _onPostTap(context, post),
      changeLang: (lang) => _changeLang(context, lang),
      refresh: () => homePageBloc.getPosts(),
    );
  }

  void _onPostTap(BuildContext context, Post post) {
    final posts = context.read<HomePageBloc>().posts;
    if (posts == null) return;

    Navigator.of(context)
      .pushNamed(
        '/post_details',
        arguments: {
          'posts': posts,
          'currentPost': post,
        },
      );
  }

  void _changeLang(BuildContext context, String lang) {
    final config = context.read<SettingsBloc>();

    if (config.lang == lang) return;

    config.lang = lang;
    context.read<HomePageBloc>().changeLang(lang);

    context.read<FavoritesBloc>().init(lang);
  }
}
