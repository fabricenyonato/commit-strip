import 'dart:convert';

import 'package:commit_strip/data/models/post.dart';
import 'package:dio/dio.dart';
import 'package:simple_result/simple_result.dart';

abstract class CommitStripRemoteDataSource {
  Future<Result<List<Post>, dynamic>> posts();
}

class CommitStripRemoteDataSourceImpl implements CommitStripRemoteDataSource {
  final Dio dio;

  CommitStripRemoteDataSourceImpl({ required this.dio });

  @override
  Future<Result<List<Post>, dynamic>> posts() async {
    const path = 'https://raw.githubusercontent.com/fabricenyonato/commit-strip/main/commit-strip-scraper/data/commit-strip.json';

    try {
      final response = await dio.get(path);
      final data = json.decode(response.data) as List;

      final posts = data
        .map((item) => Post.fromJson(item))
        .toList();

      return Result.success(posts);
    }
    catch (error) {
      return Result.failure(error);
    }
  }
}
