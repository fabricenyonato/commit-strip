import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/domain/repositories/favorite_repository.dart';
import 'package:simple_result/simple_result.dart';

class GetFavoritesUseCase {
  final FavoriteRepository repository;

  GetFavoritesUseCase({ required this.repository });

  Future<Result<List<Post>, dynamic>>
  call({required String lang}) =>
    repository.all(lang: lang);
}
