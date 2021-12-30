import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/core/providers/favorites_bloc.dart';
import 'package:commit_strip/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({ Key? key })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesBloc = context.watch<FavoritesBloc>();

    return FavoritesPageView(
      posts: favoritesBloc.state,
      onPostTap: (post) => _onPostTap(context, post),
    );
  }

  void _onPostTap(BuildContext context, Post post) {
    final favoritesBloc = context.read<FavoritesBloc>();

    Navigator.of(context)
      .pushNamed(
        '/post_details',
        arguments: {
          'posts': favoritesBloc.state,
          'currentPost': post,
        },
      );
  }
}
