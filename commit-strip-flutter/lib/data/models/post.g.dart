// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LangAttributes _$$_LangAttributesFromJson(Map<String, dynamic> json) =>
    _$_LangAttributes(
      title: json['title'] as String,
      image: json['image'] as String,
      url: json['url'] as String,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$_LangAttributesToJson(_$_LangAttributes instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'url': instance.url,
      'thumbnail': instance.thumbnail,
    };

_$_Langs _$$_LangsFromJson(Map<String, dynamic> json) => _$_Langs(
      fr: LangAttributes.fromJson(json['fr'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LangsToJson(_$_Langs instance) => <String, dynamic>{
      'fr': instance.fr,
    };

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      date: DateTime.parse(json['date'] as String),
      url: json['url'] as String,
      thumbnail: json['thumbnail'] as String?,
      langs: Langs.fromJson(json['langs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'date': instance.date.toIso8601String(),
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'langs': instance.langs,
    };
