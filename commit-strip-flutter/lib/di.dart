import 'package:commit_strip/core/data_state.dart';
import 'package:commit_strip/data/data_sources/commit_strip_remote_data_source.dart';
import 'package:commit_strip/data/repositories/commit_strip_repository_impl.dart';
import 'package:commit_strip/domain/repositories/commit_strip_repository.dart';
import 'package:commit_strip/domain/use_cases/get_posts_use_case.dart';
import 'package:commit_strip/presentation/home_page/home_page_bloc.dart';
import 'package:commit_strip/presentation/home_page/home_page_data.dart';
// import 'package:commit_strip/presentation/post_page/post_page_bloc.dart';
// import 'package:commit_strip/presentation/post_page/post_page_data.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void initDi() {
  final remoteDataSource = CommitStripRemoteDataSourceImpl(dio: Dio());
  getit.registerSingleton<CommitStripRemoteDataSource>(remoteDataSource);

  final repository = CommitStripRepositoryImpl(remoteDataSource: getit());
  getit.registerSingleton<CommitStripRepository>(repository);

  final useCase = GetPostsUseCase(repository: getit());
  getit.registerSingleton<GetPostsUseCase>(useCase);

  getit.registerFactory<HomePageBloc>(() => HomePageBloc(
    getPostsUseCase: getit(),
    initialState: const HomePageData(
      posts: DataState.success([])
    )
  ));

  /* getit.registerFactory<PostPageBloc>(() => PostPageBloc(
    initialState: const PostPageData(
      posts: [],
      currentPostIndex: 0,
    )
  )); */
}
