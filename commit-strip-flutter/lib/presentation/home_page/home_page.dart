import 'package:commit_strip/core/providers/favorites_bloc.dart';
import 'package:commit_strip/di.dart';
import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/presentation/home_page/home_page_bloc.dart';
import 'package:commit_strip/presentation/home_page/home_page_view.dart';
import 'package:commit_strip/presentation/post_page/post_page.dart';
import 'package:commit_strip/presentation/post_page/post_page_bloc.dart';
import 'package:commit_strip/presentation/post_page/post_page_data.dart';
import 'package:commit_strip/core/providers/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key })
    : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<HomePageBloc>();

    return HomePageView(
      data: bloc.state,
      onPostTap: _onPostTap,
      changeLang: _changeLang,
      toggleFavorites: () => bloc.toggleFavorites(),
      refresh: () => bloc.getPosts(),
    );
  }

  @override
  void initState() {
    super.initState();

    final lang = context.read<SettingsBloc>().lang;
    context.read<HomePageBloc>().init(lang);
  }

  void _onPostTap(Post post) {
    final posts = context.read<HomePageBloc>().posts;

    if (posts == null) return;

    final index = posts
      .indexWhere((item) => item.id == post.id);

    if (index == -1) return;

    final page = BlocProvider<PostPageBloc>(
      create: (_) => PostPageBloc(
        initialState: PostPageData(
          posts: posts,
          initialIndex: index,
        ),
        addForiteUseCase: getit()
      ),
      child: const PostPage(),
    );

    Navigator.push(context, MaterialPageRoute(
      builder: (_) => page,
    ));
  }

  void _changeLang(String lang) {
    final config = context.read<SettingsBloc>();

    if (config.lang == lang) return;

    config.lang = lang;
    context.read<HomePageBloc>().changeLang(lang);

    context.read<FavoritesBloc>().init(lang);
  }
}
