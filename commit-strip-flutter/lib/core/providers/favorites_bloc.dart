import 'package:commit_strip/domain/use_cases/add_favorite_use_case.dart';
import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/domain/use_cases/delete_favorite_use_case.dart';
import 'package:commit_strip/domain/use_cases/get_favorites_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesBloc extends Cubit<List<Post>> {
  final AddForiteUseCase addForiteUseCase;
  final DeleteFavoriteUseCase deleteFavoriteUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;

  FavoritesBloc({
    required List<Post> initialState,
    required this.addForiteUseCase,
    required this.deleteFavoriteUseCase,
    required this.getFavoritesUseCase,
  })
    : super(initialState);

  void toggleFavorite(Post post, String lang) async {
    if (contains(post)) {
      final result = await deleteFavoriteUseCase(post, lang);

      result.when(
        failure: print,
        success: (_) {
          final newState = state
            .where((item) => item.id != post.id)
            .toList();

          emit(newState);
        },
      );
    }
    else {
      final result = await addForiteUseCase(post, lang);

      result.when(
        failure: print,
        success: (_) => emit([...state, post]),
      );
    }
  }

  bool contains(Post post) {
    final index = state
      .indexWhere((item) => item.id == post.id);

    return -1 != index;
  }

  void init(String lang) async {
    final result = await getFavoritesUseCase(lang: lang);

    result.when(
      failure: (error) {},
      success: (posts) => emit(posts),
    );
  }
}
