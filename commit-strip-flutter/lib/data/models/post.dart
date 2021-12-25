import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class LangAttributes with _$LangAttributes {
  const factory LangAttributes({
    required String title,
    required String image,
    required String url,
    String? thumbnail,
  })
    = _LangAttributes;

  factory LangAttributes.fromJson(Map<String, dynamic> json) =>
    _$LangAttributesFromJson(json);
}

@freezed
class Langs with _$Langs {
  const factory Langs({
    required LangAttributes fr,
  })
    = _Langs;

  factory Langs.fromJson(Map<String, dynamic> json) =>
    _$LangsFromJson(json);
}

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String title,
    required String image,
    required DateTime date,
    required String url,
    String? thumbnail,
    required Langs langs,
  })
    = _Post;

  factory Post.fromJson(Map<String, dynamic> json) =>
    _$PostFromJson(json);
}
