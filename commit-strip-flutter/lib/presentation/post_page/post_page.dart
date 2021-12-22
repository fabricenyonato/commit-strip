import 'package:commit_strip/presentation/post_page/post_page_bloc.dart';
import 'package:commit_strip/presentation/post_page/post_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({ Key? key })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<PostPageBloc>();

    return PostPageView(
      data: bloc.state,
    );
  }
}
