import 'package:commit_strip/di.dart';
import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/presentation/home_page/home_page_bloc.dart';
import 'package:commit_strip/presentation/home_page/home_page_view.dart';
import 'package:commit_strip/presentation/post_page/post_page.dart';
import 'package:commit_strip/presentation/post_page/post_page_bloc.dart';
import 'package:commit_strip/presentation/post_page/post_page_data.dart';
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
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().init();
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
        )
      ),
      child: const PostPage(),
    );

    Navigator.push(context, MaterialPageRoute(
      builder: (_) => page,
    ));
  }
}
