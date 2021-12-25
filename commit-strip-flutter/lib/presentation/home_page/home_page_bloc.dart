import 'package:commit_strip/core/data_state.dart';
import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/domain/use_cases/get_favorites_use_case.dart';
import 'package:commit_strip/domain/use_cases/get_posts_use_case.dart';
import 'package:commit_strip/presentation/home_page/home_page_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _defaultData = HomePageData(
  posts: DataState.success([]),
  isFavorites: false,
  lang: 'en',
);

class HomePageBloc extends Cubit<HomePageData> {
  final GetPostsUseCase getPostsUseCase;
  final GetFavoritesUseCase getForitesUseCase;

  HomePageBloc({
    HomePageData initialState = _defaultData,
    required this.getPostsUseCase,
    required this.getForitesUseCase
  })
    : super(initialState);

  void init(String lang) {
    changeLang(lang);
  }

  void getPosts() async {
    emit(state.copyWith(posts: const DataState.loading()));

    final result = await getPostsUseCase(languageCode: state.lang);

    result.when(
      failure: (error) =>
        emit(state.copyWith(posts: DataState.error(error))),
      success: (posts) =>
        emit(state.copyWith(posts: DataState.success(posts))),
    );
  }

  void changeLang(String lang) {
    emit(state.copyWith(lang: lang));
    getPosts();
  }

  List<Post>? get posts =>
    state.posts.when(
      loading: () => null,
      error: (_) => null,
      success: (posts) => posts,
    );

  void toggleFavorites() async {
    final isFavorites = !state.isFavorites;

    emit(state.copyWith(isFavorites: isFavorites));

    if (isFavorites) {
      emit(state.copyWith(posts: const DataState.loading()));

      final result = await getForitesUseCase(lang: state.lang);

      result.when(
        failure: (error) =>
          emit(state.copyWith(posts: DataState.error(error))),
        success: (posts) =>
          emit(state.copyWith(posts: DataState.success(posts))),
      );
    }
    else {
      getPosts();
    }
  }
}
