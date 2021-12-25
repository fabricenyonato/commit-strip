import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/domain/repositories/favorite_repository.dart';
import 'package:simple_result/simple_result.dart';

class DeleteFavoriteUseCase {
  final FavoriteRepository repository;

  DeleteFavoriteUseCase({ required this.repository });

  Future<Result<void, dynamic>>
  call(Post post, String lang) =>
    repository.delete(post, lang);
}
