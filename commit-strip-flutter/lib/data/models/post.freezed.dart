// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LangAttributes _$LangAttributesFromJson(Map<String, dynamic> json) {
  return _LangAttributes.fromJson(json);
}

/// @nodoc
class _$LangAttributesTearOff {
  const _$LangAttributesTearOff();

  _LangAttributes call(
      {required String title,
      required String image,
      required String url,
      String? thumbnail}) {
    return _LangAttributes(
      title: title,
      image: image,
      url: url,
      thumbnail: thumbnail,
    );
  }

  LangAttributes fromJson(Map<String, Object?> json) {
    return LangAttributes.fromJson(json);
  }
}

/// @nodoc
const $LangAttributes = _$LangAttributesTearOff();

/// @nodoc
mixin _$LangAttributes {
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LangAttributesCopyWith<LangAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LangAttributesCopyWith<$Res> {
  factory $LangAttributesCopyWith(
          LangAttributes value, $Res Function(LangAttributes) then) =
      _$LangAttributesCopyWithImpl<$Res>;
  $Res call({String title, String image, String url, String? thumbnail});
}

/// @nodoc
class _$LangAttributesCopyWithImpl<$Res>
    implements $LangAttributesCopyWith<$Res> {
  _$LangAttributesCopyWithImpl(this._value, this._then);

  final LangAttributes _value;
  // ignore: unused_field
  final $Res Function(LangAttributes) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? image = freezed,
    Object? url = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LangAttributesCopyWith<$Res>
    implements $LangAttributesCopyWith<$Res> {
  factory _$LangAttributesCopyWith(
          _LangAttributes value, $Res Function(_LangAttributes) then) =
      __$LangAttributesCopyWithImpl<$Res>;
  @override
  $Res call({String title, String image, String url, String? thumbnail});
}

/// @nodoc
class __$LangAttributesCopyWithImpl<$Res>
    extends _$LangAttributesCopyWithImpl<$Res>
    implements _$LangAttributesCopyWith<$Res> {
  __$LangAttributesCopyWithImpl(
      _LangAttributes _value, $Res Function(_LangAttributes) _then)
      : super(_value, (v) => _then(v as _LangAttributes));

  @override
  _LangAttributes get _value => super._value as _LangAttributes;

  @override
  $Res call({
    Object? title = freezed,
    Object? image = freezed,
    Object? url = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_LangAttributes(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LangAttributes implements _LangAttributes {
  const _$_LangAttributes(
      {required this.title,
      required this.image,
      required this.url,
      this.thumbnail});

  factory _$_LangAttributes.fromJson(Map<String, dynamic> json) =>
      _$$_LangAttributesFromJson(json);

  @override
  final String title;
  @override
  final String image;
  @override
  final String url;
  @override
  final String? thumbnail;

  @override
  String toString() {
    return 'LangAttributes(title: $title, image: $image, url: $url, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LangAttributes &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(thumbnail));

  @JsonKey(ignore: true)
  @override
  _$LangAttributesCopyWith<_LangAttributes> get copyWith =>
      __$LangAttributesCopyWithImpl<_LangAttributes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LangAttributesToJson(this);
  }
}

abstract class _LangAttributes implements LangAttributes {
  const factory _LangAttributes(
      {required String title,
      required String image,
      required String url,
      String? thumbnail}) = _$_LangAttributes;

  factory _LangAttributes.fromJson(Map<String, dynamic> json) =
      _$_LangAttributes.fromJson;

  @override
  String get title;
  @override
  String get image;
  @override
  String get url;
  @override
  String? get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$LangAttributesCopyWith<_LangAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}

Langs _$LangsFromJson(Map<String, dynamic> json) {
  return _Langs.fromJson(json);
}

/// @nodoc
class _$LangsTearOff {
  const _$LangsTearOff();

  _Langs call({required LangAttributes fr}) {
    return _Langs(
      fr: fr,
    );
  }

  Langs fromJson(Map<String, Object?> json) {
    return Langs.fromJson(json);
  }
}

/// @nodoc
const $Langs = _$LangsTearOff();

/// @nodoc
mixin _$Langs {
  LangAttributes get fr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LangsCopyWith<Langs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LangsCopyWith<$Res> {
  factory $LangsCopyWith(Langs value, $Res Function(Langs) then) =
      _$LangsCopyWithImpl<$Res>;
  $Res call({LangAttributes fr});

  $LangAttributesCopyWith<$Res> get fr;
}

/// @nodoc
class _$LangsCopyWithImpl<$Res> implements $LangsCopyWith<$Res> {
  _$LangsCopyWithImpl(this._value, this._then);

  final Langs _value;
  // ignore: unused_field
  final $Res Function(Langs) _then;

  @override
  $Res call({
    Object? fr = freezed,
  }) {
    return _then(_value.copyWith(
      fr: fr == freezed
          ? _value.fr
          : fr // ignore: cast_nullable_to_non_nullable
              as LangAttributes,
    ));
  }

  @override
  $LangAttributesCopyWith<$Res> get fr {
    return $LangAttributesCopyWith<$Res>(_value.fr, (value) {
      return _then(_value.copyWith(fr: value));
    });
  }
}

/// @nodoc
abstract class _$LangsCopyWith<$Res> implements $LangsCopyWith<$Res> {
  factory _$LangsCopyWith(_Langs value, $Res Function(_Langs) then) =
      __$LangsCopyWithImpl<$Res>;
  @override
  $Res call({LangAttributes fr});

  @override
  $LangAttributesCopyWith<$Res> get fr;
}

/// @nodoc
class __$LangsCopyWithImpl<$Res> extends _$LangsCopyWithImpl<$Res>
    implements _$LangsCopyWith<$Res> {
  __$LangsCopyWithImpl(_Langs _value, $Res Function(_Langs) _then)
      : super(_value, (v) => _then(v as _Langs));

  @override
  _Langs get _value => super._value as _Langs;

  @override
  $Res call({
    Object? fr = freezed,
  }) {
    return _then(_Langs(
      fr: fr == freezed
          ? _value.fr
          : fr // ignore: cast_nullable_to_non_nullable
              as LangAttributes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Langs implements _Langs {
  const _$_Langs({required this.fr});

  factory _$_Langs.fromJson(Map<String, dynamic> json) =>
      _$$_LangsFromJson(json);

  @override
  final LangAttributes fr;

  @override
  String toString() {
    return 'Langs(fr: $fr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Langs &&
            const DeepCollectionEquality().equals(other.fr, fr));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(fr));

  @JsonKey(ignore: true)
  @override
  _$LangsCopyWith<_Langs> get copyWith =>
      __$LangsCopyWithImpl<_Langs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LangsToJson(this);
  }
}

abstract class _Langs implements Langs {
  const factory _Langs({required LangAttributes fr}) = _$_Langs;

  factory _Langs.fromJson(Map<String, dynamic> json) = _$_Langs.fromJson;

  @override
  LangAttributes get fr;
  @override
  @JsonKey(ignore: true)
  _$LangsCopyWith<_Langs> get copyWith => throw _privateConstructorUsedError;
}

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
class _$PostTearOff {
  const _$PostTearOff();

  _Post call(
      {required String id,
      required String title,
      required String image,
      required DateTime date,
      required String url,
      String? thumbnail,
      required Langs langs}) {
    return _Post(
      id: id,
      title: title,
      image: image,
      date: date,
      url: url,
      thumbnail: thumbnail,
      langs: langs,
    );
  }

  Post fromJson(Map<String, Object?> json) {
    return Post.fromJson(json);
  }
}

/// @nodoc
const $Post = _$PostTearOff();

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  Langs get langs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String image,
      DateTime date,
      String url,
      String? thumbnail,
      Langs langs});

  $LangsCopyWith<$Res> get langs;
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? date = freezed,
    Object? url = freezed,
    Object? thumbnail = freezed,
    Object? langs = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      langs: langs == freezed
          ? _value.langs
          : langs // ignore: cast_nullable_to_non_nullable
              as Langs,
    ));
  }

  @override
  $LangsCopyWith<$Res> get langs {
    return $LangsCopyWith<$Res>(_value.langs, (value) {
      return _then(_value.copyWith(langs: value));
    });
  }
}

/// @nodoc
abstract class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String image,
      DateTime date,
      String url,
      String? thumbnail,
      Langs langs});

  @override
  $LangsCopyWith<$Res> get langs;
}

/// @nodoc
class __$PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(_Post _value, $Res Function(_Post) _then)
      : super(_value, (v) => _then(v as _Post));

  @override
  _Post get _value => super._value as _Post;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? date = freezed,
    Object? url = freezed,
    Object? thumbnail = freezed,
    Object? langs = freezed,
  }) {
    return _then(_Post(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      langs: langs == freezed
          ? _value.langs
          : langs // ignore: cast_nullable_to_non_nullable
              as Langs,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post implements _Post {
  const _$_Post(
      {required this.id,
      required this.title,
      required this.image,
      required this.date,
      required this.url,
      this.thumbnail,
      required this.langs});

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String image;
  @override
  final DateTime date;
  @override
  final String url;
  @override
  final String? thumbnail;
  @override
  final Langs langs;

  @override
  String toString() {
    return 'Post(id: $id, title: $title, image: $image, date: $date, url: $url, thumbnail: $thumbnail, langs: $langs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Post &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality().equals(other.langs, langs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(langs));

  @JsonKey(ignore: true)
  @override
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(this);
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {required String id,
      required String title,
      required String image,
      required DateTime date,
      required String url,
      String? thumbnail,
      required Langs langs}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get image;
  @override
  DateTime get date;
  @override
  String get url;
  @override
  String? get thumbnail;
  @override
  Langs get langs;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}
