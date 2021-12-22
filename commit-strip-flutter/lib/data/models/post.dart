import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String title,
    required String image,
    String? thumbnail,
  })
    = _Post;

  factory Post.fromJson(Map<String, dynamic> json) =>
    _$PostFromJson(json);
}
