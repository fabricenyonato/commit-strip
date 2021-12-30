import 'package:commit_strip/core/providers/favorites_bloc.dart';
import 'package:commit_strip/data/data_sources/commit_strip_remote_data_source.dart';
import 'package:commit_strip/data/data_sources/local/favorite_data_source.dart';
import 'package:commit_strip/data/data_sources/local/entities/post.dart' as local;
import 'package:commit_strip/data/repositories/commit_strip_repository_impl.dart';
import 'package:commit_strip/data/repositories/favorite_repository_impl.dart';
import 'package:commit_strip/domain/repositories/commit_strip_repository.dart';
import 'package:commit_strip/domain/repositories/favorite_repository.dart';
import 'package:commit_strip/domain/use_cases/add_favorite_use_case.dart';
import 'package:commit_strip/domain/use_cases/delete_favorite_use_case.dart';
import 'package:commit_strip/domain/use_cases/get_favorites_use_case.dart';
import 'package:commit_strip/domain/use_cases/get_posts_use_case.dart';
import 'package:commit_strip/presentation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

final getit = GetIt.instance;

void _useCases() {
  final getPostsUseCase =
    GetPostsUseCase(repository: getit());
  getit.registerSingleton<GetPostsUseCase>(getPostsUseCase);

  final getForitesUseCase =
    GetFavoritesUseCase(repository: getit());
  getit.registerSingleton<GetFavoritesUseCase>(getForitesUseCase);

  final addForiteUseCase =
    AddForiteUseCase(repository: getit());
  getit.registerSingleton<AddForiteUseCase>(addForiteUseCase);

  final deleteForiteUseCase =
    DeleteFavoriteUseCase(repository: getit());
  getit.registerSingleton<DeleteFavoriteUseCase>(deleteForiteUseCase);
}

void _dataSources() {
  final remoteDataSource = CommitStripRemoteDataSourceImpl(dio: Dio());
  getit.registerSingleton<CommitStripRemoteDataSource>(remoteDataSource);

  getit.registerSingleton<FavoriteDataSource>(FavoriteDataSourceImpl(
    postsBox: Hive.box<local.Post>('posts')
  ));
}

void _repositories() {
  final repository =
    CommitStripRepositoryImpl(remoteDataSource: getit());
  getit.registerSingleton<CommitStripRepository>(repository);

  final favoriteRepository =
    FavoriteRepositoryImpl(favoriteDataSource: getit());
  getit.registerSingleton<FavoriteRepository>(favoriteRepository);
}

void initDi() {
  _dataSources();
  _repositories();
  _useCases();

  getit.registerFactory<HomePageBloc>(() => HomePageBloc(
    getPostsUseCase: getit(),
    getForitesUseCase: getit(),
  ));

  getit.registerFactory<FavoritesBloc>(() => FavoritesBloc(
    initialState: [],
    addForiteUseCase: getit(),
    deleteFavoriteUseCase: getit(),
    getFavoritesUseCase: getit(),
  ));
}
