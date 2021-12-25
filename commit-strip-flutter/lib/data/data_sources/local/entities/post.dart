import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'post.g.dart';
part 'post.freezed.dart';

@freezed
@HiveType(typeId: 0)
class Post with _$Post {
  const factory Post({
    @HiveField(0)
    required String id,

    @HiveField(1)
    required String title,

    @HiveField(2)
    required String image,

    @HiveField(3)
    String? thumbnail,

    @HiveField(4)
    required DateTime date,

    @HiveField(5)
    required String url,

    @HiveField(6)
    required String lang,
  }) =
    _Post;
}
