import 'package:commit_strip/domain/entities/post.dart';
import 'package:simple_result/simple_result.dart';

abstract class CommitStripRepository {
  Future<Result<List<Post>, dynamic>> posts({
    required String languageCode,
  });
}
