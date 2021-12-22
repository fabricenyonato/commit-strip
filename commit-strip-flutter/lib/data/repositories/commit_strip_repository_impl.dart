import 'package:commit_strip/data/data_sources/commit_strip_remote_data_source.dart';
import 'package:commit_strip/domain/entities/post.dart' as entities;
import 'package:commit_strip/domain/repositories/commit_strip_repository.dart';
import 'package:simple_result/simple_result.dart';

class CommitStripRepositoryImpl implements CommitStripRepository {
  final CommitStripRemoteDataSource remoteDataSource;

  const CommitStripRepositoryImpl({ required this.remoteDataSource });

  @override
  Future<Result<List<entities.Post>, dynamic>> posts() async {
    final data = await remoteDataSource.posts();

    return data.when(
      failure: (error) => Result.failure(error),
      success: (data) {
        final posts = data
          .map((item) => entities.Post(
            title: item.title,
            image: item.image,
            thumbnail: item.thumbnail,
            id: item.id,
          ))
          .toList();

        return Result.success(posts);
      },
    );
  }
}
