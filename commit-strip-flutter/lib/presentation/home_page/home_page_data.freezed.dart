// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomePageDataTearOff {
  const _$HomePageDataTearOff();

  _HomePageData call({required DataState<List<Post>> posts}) {
    return _HomePageData(
      posts: posts,
    );
  }
}

/// @nodoc
const $HomePageData = _$HomePageDataTearOff();

/// @nodoc
mixin _$HomePageData {
  DataState<List<Post>> get posts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageDataCopyWith<HomePageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageDataCopyWith<$Res> {
  factory $HomePageDataCopyWith(
          HomePageData value, $Res Function(HomePageData) then) =
      _$HomePageDataCopyWithImpl<$Res>;
  $Res call({DataState<List<Post>> posts});

  $DataStateCopyWith<List<Post>, $Res> get posts;
}

/// @nodoc
class _$HomePageDataCopyWithImpl<$Res> implements $HomePageDataCopyWith<$Res> {
  _$HomePageDataCopyWithImpl(this._value, this._then);

  final HomePageData _value;
  // ignore: unused_field
  final $Res Function(HomePageData) _then;

  @override
  $Res call({
    Object? posts = freezed,
  }) {
    return _then(_value.copyWith(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as DataState<List<Post>>,
    ));
  }

  @override
  $DataStateCopyWith<List<Post>, $Res> get posts {
    return $DataStateCopyWith<List<Post>, $Res>(_value.posts, (value) {
      return _then(_value.copyWith(posts: value));
    });
  }
}

/// @nodoc
abstract class _$HomePageDataCopyWith<$Res>
    implements $HomePageDataCopyWith<$Res> {
  factory _$HomePageDataCopyWith(
          _HomePageData value, $Res Function(_HomePageData) then) =
      __$HomePageDataCopyWithImpl<$Res>;
  @override
  $Res call({DataState<List<Post>> posts});

  @override
  $DataStateCopyWith<List<Post>, $Res> get posts;
}

/// @nodoc
class __$HomePageDataCopyWithImpl<$Res> extends _$HomePageDataCopyWithImpl<$Res>
    implements _$HomePageDataCopyWith<$Res> {
  __$HomePageDataCopyWithImpl(
      _HomePageData _value, $Res Function(_HomePageData) _then)
      : super(_value, (v) => _then(v as _HomePageData));

  @override
  _HomePageData get _value => super._value as _HomePageData;

  @override
  $Res call({
    Object? posts = freezed,
  }) {
    return _then(_HomePageData(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as DataState<List<Post>>,
    ));
  }
}

/// @nodoc

class _$_HomePageData implements _HomePageData {
  const _$_HomePageData({required this.posts});

  @override
  final DataState<List<Post>> posts;

  @override
  String toString() {
    return 'HomePageData(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomePageData &&
            const DeepCollectionEquality().equals(other.posts, posts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(posts));

  @JsonKey(ignore: true)
  @override
  _$HomePageDataCopyWith<_HomePageData> get copyWith =>
      __$HomePageDataCopyWithImpl<_HomePageData>(this, _$identity);
}

abstract class _HomePageData implements HomePageData {
  const factory _HomePageData({required DataState<List<Post>> posts}) =
      _$_HomePageData;

  @override
  DataState<List<Post>> get posts;
  @override
  @JsonKey(ignore: true)
  _$HomePageDataCopyWith<_HomePageData> get copyWith =>
      throw _privateConstructorUsedError;
}
