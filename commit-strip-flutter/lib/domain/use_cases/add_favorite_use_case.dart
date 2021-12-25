import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/domain/repositories/favorite_repository.dart';
import 'package:simple_result/simple_result.dart';

class AddForiteUseCase {
  final FavoriteRepository repository;

  AddForiteUseCase({ required this.repository });

  Future<Result<void, dynamic>> call(Post post, String lang) =>
    repository.add(post, lang);
}
