import 'package:commit_strip/data/data_sources/commit_strip_remote_data_source.dart';
import 'package:commit_strip/domain/entities/post.dart' as entities;
import 'package:commit_strip/domain/repositories/commit_strip_repository.dart';
import 'package:simple_result/simple_result.dart';

class CommitStripRepositoryImpl implements CommitStripRepository {
  final CommitStripRemoteDataSource remoteDataSource;

  const CommitStripRepositoryImpl({ required this.remoteDataSource });

  @override
  Future<Result<List<entities.Post>, dynamic>> posts({
    required String languageCode,
  }) async {
    final data = await remoteDataSource.posts();

    return data.when(
      failure: (error) => Result.failure(error),
      success: (data) {
        final posts = data
          .map((item) {
            final lang =
              languageCode == 'en' ? null : item.langs.fr;

            return entities.Post(
              id: item.id,
              date: item.date,
              title: lang?.title ?? item.title,
              image: lang?.image ?? item.image,
              thumbnail: lang?.thumbnail ?? item.thumbnail,
              url: lang?.url ?? item.url,
            );
          })
          .toList();

        return Result.success(posts);
      },
    );
  }
}
