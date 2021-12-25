import 'package:commit_strip/data/data_sources/local/entities/post.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simple_result/simple_result.dart';

abstract class FavoriteDataSource {
  Future<Result<List<Post>, dynamic>> all({ required String lang });
  Future<Result<Post, dynamic>> add(Post post);
  Future<Result<Post, dynamic>> delete(Post post);
}

class FavoriteDataSourceImpl implements FavoriteDataSource {
  final Box<Post> postsBox;

  FavoriteDataSourceImpl({ required this.postsBox });

  @override
  Future<Result<List<Post>, dynamic>>
  all({ required String lang }) async {
    try {
      final posts = postsBox.values
        .where((post) => post.lang == lang)
        .toList();

      return Result.success(posts);
    }
    catch (error) {
      return Result.failure(error);
    }
  }

  @override
  Future<Result<Post, dynamic>> add(Post post) async {
    try {
      await postsBox.put('${post.id}_${post.lang}', post);
      return Result.success(post);
    }
    catch (error) {
      return Result.failure(error);
    }
  }

  @override
  Future<Result<Post, dynamic>> delete(Post post) async {
    try {
      await postsBox.delete('${post.id}_${post.lang}');
      return Result.success(post);
    }
    catch (error) {
      return Result.failure(error);
    }
  }
}
