// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NavItemDataTearOff {
  const _$NavItemDataTearOff();

  _NavItemData call(
      {required NavItemId id, required IconData icon, required String label}) {
    return _NavItemData(
      id: id,
      icon: icon,
      label: label,
    );
  }
}

/// @nodoc
const $NavItemData = _$NavItemDataTearOff();

/// @nodoc
mixin _$NavItemData {
  NavItemId get id => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavItemDataCopyWith<NavItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavItemDataCopyWith<$Res> {
  factory $NavItemDataCopyWith(
          NavItemData value, $Res Function(NavItemData) then) =
      _$NavItemDataCopyWithImpl<$Res>;
  $Res call({NavItemId id, IconData icon, String label});
}

/// @nodoc
class _$NavItemDataCopyWithImpl<$Res> implements $NavItemDataCopyWith<$Res> {
  _$NavItemDataCopyWithImpl(this._value, this._then);

  final NavItemData _value;
  // ignore: unused_field
  final $Res Function(NavItemData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? icon = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as NavItemId,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NavItemDataCopyWith<$Res>
    implements $NavItemDataCopyWith<$Res> {
  factory _$NavItemDataCopyWith(
          _NavItemData value, $Res Function(_NavItemData) then) =
      __$NavItemDataCopyWithImpl<$Res>;
  @override
  $Res call({NavItemId id, IconData icon, String label});
}

/// @nodoc
class __$NavItemDataCopyWithImpl<$Res> extends _$NavItemDataCopyWithImpl<$Res>
    implements _$NavItemDataCopyWith<$Res> {
  __$NavItemDataCopyWithImpl(
      _NavItemData _value, $Res Function(_NavItemData) _then)
      : super(_value, (v) => _then(v as _NavItemData));

  @override
  _NavItemData get _value => super._value as _NavItemData;

  @override
  $Res call({
    Object? id = freezed,
    Object? icon = freezed,
    Object? label = freezed,
  }) {
    return _then(_NavItemData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as NavItemId,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NavItemData implements _NavItemData {
  const _$_NavItemData(
      {required this.id, required this.icon, required this.label});

  @override
  final NavItemId id;
  @override
  final IconData icon;
  @override
  final String label;

  @override
  String toString() {
    return 'NavItemData(id: $id, icon: $icon, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavItemData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.label, label));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(label));

  @JsonKey(ignore: true)
  @override
  _$NavItemDataCopyWith<_NavItemData> get copyWith =>
      __$NavItemDataCopyWithImpl<_NavItemData>(this, _$identity);
}

abstract class _NavItemData implements NavItemData {
  const factory _NavItemData(
      {required NavItemId id,
      required IconData icon,
      required String label}) = _$_NavItemData;

  @override
  NavItemId get id;
  @override
  IconData get icon;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$NavItemDataCopyWith<_NavItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$MainPageDataTearOff {
  const _$MainPageDataTearOff();

  _MainPageData call({required NavItemId currentNavId}) {
    return _MainPageData(
      currentNavId: currentNavId,
    );
  }
}

/// @nodoc
const $MainPageData = _$MainPageDataTearOff();

/// @nodoc
mixin _$MainPageData {
  NavItemId get currentNavId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainPageDataCopyWith<MainPageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainPageDataCopyWith<$Res> {
  factory $MainPageDataCopyWith(
          MainPageData value, $Res Function(MainPageData) then) =
      _$MainPageDataCopyWithImpl<$Res>;
  $Res call({NavItemId currentNavId});
}

/// @nodoc
class _$MainPageDataCopyWithImpl<$Res> implements $MainPageDataCopyWith<$Res> {
  _$MainPageDataCopyWithImpl(this._value, this._then);

  final MainPageData _value;
  // ignore: unused_field
  final $Res Function(MainPageData) _then;

  @override
  $Res call({
    Object? currentNavId = freezed,
  }) {
    return _then(_value.copyWith(
      currentNavId: currentNavId == freezed
          ? _value.currentNavId
          : currentNavId // ignore: cast_nullable_to_non_nullable
              as NavItemId,
    ));
  }
}

/// @nodoc
abstract class _$MainPageDataCopyWith<$Res>
    implements $MainPageDataCopyWith<$Res> {
  factory _$MainPageDataCopyWith(
          _MainPageData value, $Res Function(_MainPageData) then) =
      __$MainPageDataCopyWithImpl<$Res>;
  @override
  $Res call({NavItemId currentNavId});
}

/// @nodoc
class __$MainPageDataCopyWithImpl<$Res> extends _$MainPageDataCopyWithImpl<$Res>
    implements _$MainPageDataCopyWith<$Res> {
  __$MainPageDataCopyWithImpl(
      _MainPageData _value, $Res Function(_MainPageData) _then)
      : super(_value, (v) => _then(v as _MainPageData));

  @override
  _MainPageData get _value => super._value as _MainPageData;

  @override
  $Res call({
    Object? currentNavId = freezed,
  }) {
    return _then(_MainPageData(
      currentNavId: currentNavId == freezed
          ? _value.currentNavId
          : currentNavId // ignore: cast_nullable_to_non_nullable
              as NavItemId,
    ));
  }
}

/// @nodoc

class _$_MainPageData implements _MainPageData {
  const _$_MainPageData({required this.currentNavId});

  @override
  final NavItemId currentNavId;

  @override
  String toString() {
    return 'MainPageData(currentNavId: $currentNavId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MainPageData &&
            const DeepCollectionEquality()
                .equals(other.currentNavId, currentNavId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentNavId));

  @JsonKey(ignore: true)
  @override
  _$MainPageDataCopyWith<_MainPageData> get copyWith =>
      __$MainPageDataCopyWithImpl<_MainPageData>(this, _$identity);
}

abstract class _MainPageData implements MainPageData {
  const factory _MainPageData({required NavItemId currentNavId}) =
      _$_MainPageData;

  @override
  NavItemId get currentNavId;
  @override
  @JsonKey(ignore: true)
  _$MainPageDataCopyWith<_MainPageData> get copyWith =>
      throw _privateConstructorUsedError;
}
