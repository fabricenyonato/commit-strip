import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/domain/repositories/commit_strip_repository.dart';
import 'package:simple_result/simple_result.dart';

class GetPostsUseCase {
  final CommitStripRepository repository;

  GetPostsUseCase({ required this.repository });

  Future<Result<List<Post>, dynamic>> call() =>
    repository.posts();
}
