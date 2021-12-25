import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'settings_bloc.freezed.dart';

const settingsBoxName = 'settings';
const settingsBoxLangFiled = 'lang';

@freezed
class SettingsData with _$SettingsData {
  const factory SettingsData({ required String language })
    = _SettingsData;
}

const _defaultData = SettingsData(language: 'en');

class SettingsBloc extends Cubit<SettingsData> {
  SettingsBloc([SettingsData initialState = _defaultData])
    : super(initialState);

  Locale get locale =>
    Locale(state.language);

  String get lang => state.language;

  set lang(String value) {
    if (value == state.language) return;

    final settings = Hive.box(settingsBoxName);
    settings.put(settingsBoxLangFiled, value);

    emit(state.copyWith(language: value));
  }
}
