// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostPageDataTearOff {
  const _$PostPageDataTearOff();

  _PostPageData call({required List<Post> posts, required int initialIndex}) {
    return _PostPageData(
      posts: posts,
      initialIndex: initialIndex,
    );
  }
}

/// @nodoc
const $PostPageData = _$PostPageDataTearOff();

/// @nodoc
mixin _$PostPageData {
  List<Post> get posts => throw _privateConstructorUsedError;
  int get initialIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostPageDataCopyWith<PostPageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostPageDataCopyWith<$Res> {
  factory $PostPageDataCopyWith(
          PostPageData value, $Res Function(PostPageData) then) =
      _$PostPageDataCopyWithImpl<$Res>;
  $Res call({List<Post> posts, int initialIndex});
}

/// @nodoc
class _$PostPageDataCopyWithImpl<$Res> implements $PostPageDataCopyWith<$Res> {
  _$PostPageDataCopyWithImpl(this._value, this._then);

  final PostPageData _value;
  // ignore: unused_field
  final $Res Function(PostPageData) _then;

  @override
  $Res call({
    Object? posts = freezed,
    Object? initialIndex = freezed,
  }) {
    return _then(_value.copyWith(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      initialIndex: initialIndex == freezed
          ? _value.initialIndex
          : initialIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PostPageDataCopyWith<$Res>
    implements $PostPageDataCopyWith<$Res> {
  factory _$PostPageDataCopyWith(
          _PostPageData value, $Res Function(_PostPageData) then) =
      __$PostPageDataCopyWithImpl<$Res>;
  @override
  $Res call({List<Post> posts, int initialIndex});
}

/// @nodoc
class __$PostPageDataCopyWithImpl<$Res> extends _$PostPageDataCopyWithImpl<$Res>
    implements _$PostPageDataCopyWith<$Res> {
  __$PostPageDataCopyWithImpl(
      _PostPageData _value, $Res Function(_PostPageData) _then)
      : super(_value, (v) => _then(v as _PostPageData));

  @override
  _PostPageData get _value => super._value as _PostPageData;

  @override
  $Res call({
    Object? posts = freezed,
    Object? initialIndex = freezed,
  }) {
    return _then(_PostPageData(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      initialIndex: initialIndex == freezed
          ? _value.initialIndex
          : initialIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PostPageData implements _PostPageData {
  const _$_PostPageData({required this.posts, required this.initialIndex});

  @override
  final List<Post> posts;
  @override
  final int initialIndex;

  @override
  String toString() {
    return 'PostPageData(posts: $posts, initialIndex: $initialIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostPageData &&
            const DeepCollectionEquality().equals(other.posts, posts) &&
            const DeepCollectionEquality()
                .equals(other.initialIndex, initialIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(posts),
      const DeepCollectionEquality().hash(initialIndex));

  @JsonKey(ignore: true)
  @override
  _$PostPageDataCopyWith<_PostPageData> get copyWith =>
      __$PostPageDataCopyWithImpl<_PostPageData>(this, _$identity);
}

abstract class _PostPageData implements PostPageData {
  const factory _PostPageData(
      {required List<Post> posts, required int initialIndex}) = _$_PostPageData;

  @override
  List<Post> get posts;
  @override
  int get initialIndex;
  @override
  @JsonKey(ignore: true)
  _$PostPageDataCopyWith<_PostPageData> get copyWith =>
      throw _privateConstructorUsedError;
}
