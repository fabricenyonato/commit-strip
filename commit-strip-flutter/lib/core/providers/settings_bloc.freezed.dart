// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingsDataTearOff {
  const _$SettingsDataTearOff();

  _SettingsData call({required String language}) {
    return _SettingsData(
      language: language,
    );
  }
}

/// @nodoc
const $SettingsData = _$SettingsDataTearOff();

/// @nodoc
mixin _$SettingsData {
  String get language => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsDataCopyWith<SettingsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsDataCopyWith<$Res> {
  factory $SettingsDataCopyWith(
          SettingsData value, $Res Function(SettingsData) then) =
      _$SettingsDataCopyWithImpl<$Res>;
  $Res call({String language});
}

/// @nodoc
class _$SettingsDataCopyWithImpl<$Res> implements $SettingsDataCopyWith<$Res> {
  _$SettingsDataCopyWithImpl(this._value, this._then);

  final SettingsData _value;
  // ignore: unused_field
  final $Res Function(SettingsData) _then;

  @override
  $Res call({
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SettingsDataCopyWith<$Res>
    implements $SettingsDataCopyWith<$Res> {
  factory _$SettingsDataCopyWith(
          _SettingsData value, $Res Function(_SettingsData) then) =
      __$SettingsDataCopyWithImpl<$Res>;
  @override
  $Res call({String language});
}

/// @nodoc
class __$SettingsDataCopyWithImpl<$Res> extends _$SettingsDataCopyWithImpl<$Res>
    implements _$SettingsDataCopyWith<$Res> {
  __$SettingsDataCopyWithImpl(
      _SettingsData _value, $Res Function(_SettingsData) _then)
      : super(_value, (v) => _then(v as _SettingsData));

  @override
  _SettingsData get _value => super._value as _SettingsData;

  @override
  $Res call({
    Object? language = freezed,
  }) {
    return _then(_SettingsData(
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SettingsData implements _SettingsData {
  const _$_SettingsData({required this.language});

  @override
  final String language;

  @override
  String toString() {
    return 'SettingsData(language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingsData &&
            const DeepCollectionEquality().equals(other.language, language));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(language));

  @JsonKey(ignore: true)
  @override
  _$SettingsDataCopyWith<_SettingsData> get copyWith =>
      __$SettingsDataCopyWithImpl<_SettingsData>(this, _$identity);
}

abstract class _SettingsData implements SettingsData {
  const factory _SettingsData({required String language}) = _$_SettingsData;

  @override
  String get language;
  @override
  @JsonKey(ignore: true)
  _$SettingsDataCopyWith<_SettingsData> get copyWith =>
      throw _privateConstructorUsedError;
}
