import 'package:commit_strip/domain/entities/post.dart';
import 'package:simple_result/simple_result.dart';

abstract class FavoriteRepository {
  Future<Result<List<Post>, dynamic>> all({
    required String lang,
  });

  Future<Result<void, dynamic>> add(Post post, String lang);
  Future<Result<void, dynamic>> delete(Post post, String lang);
}
