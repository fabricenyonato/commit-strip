import 'package:commit_strip/data/data_sources/local/favorite_data_source.dart';
import 'package:commit_strip/data/data_sources/local/entities/post.dart';
import 'package:commit_strip/domain/entities/post.dart' as entities;
import 'package:commit_strip/domain/repositories/favorite_repository.dart';
import 'package:simple_result/simple_result.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteDataSource favoriteDataSource;

  const FavoriteRepositoryImpl({ required this.favoriteDataSource });

  @override
  Future<Result<List<entities.Post>, dynamic>>
  all({required String lang}) async {
    final data = await favoriteDataSource.all(lang: lang);

    return data.when(
      failure: (error) => Result.failure(error),
      success: (data) {
        final posts = data
          .map((item) {
            return entities.Post(
              id: item.id,
              date: item.date,
              title: item.title,
              image: item.image,
              thumbnail: item.thumbnail,
              url: item.url,
            );
          })
          .toList();

        return Result.success(posts);
      },
    );
  }

  @override
  Future<Result<void, dynamic>>
  add(entities.Post post, String lang) async {
    final result = await favoriteDataSource
      .add(_convert(post, lang));

    return result.mapSuccess((p0) => const Result.success(null));
  }

  @override
  Future<Result<void, dynamic>>
  delete(entities.Post post, String lang) async {
    final result = await favoriteDataSource
      .delete(_convert(post, lang));

    return result.mapSuccess((p0) => const Result.success(null));
  }

  Post _convert(entities.Post post, String lang) => Post(
    lang: lang,
    title: post.title,
    image: post.image,
    thumbnail: post.thumbnail,
    url: post.url,
    id: post.id,
    date: post.date,
  );
}
