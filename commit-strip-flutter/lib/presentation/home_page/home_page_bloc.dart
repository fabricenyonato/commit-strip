import 'package:commit_strip/core/data_state.dart';
import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/domain/use_cases/get_posts_use_case.dart';
import 'package:commit_strip/presentation/home_page/home_page_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Cubit<HomePageData> {
  final GetPostsUseCase getPostsUseCase;

  HomePageBloc({
    required HomePageData initialState,
    required this.getPostsUseCase,
  })
    : super(initialState);

  void init() async {
    emit(state.copyWith(posts: const DataState.loading()));

    final posts = await getPostsUseCase();

    posts.when(
      failure: (error) =>
        emit(state.copyWith(posts: DataState.error(error))),
      success: (posts) =>
        emit(state.copyWith(posts: DataState.success(posts))),
    );
  }

  List<Post>? get posts =>
    state.posts.when(
      loading: () => null,
      error: (_) => null,
      success: (posts) => posts,
    );
}
