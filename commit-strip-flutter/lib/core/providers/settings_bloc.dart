import 'package:commit_strip/vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'settings_bloc.freezed.dart';

const settingsBoxName = 'settings';
const settingsBoxLangFiled = 'lang';

@freezed
class SettingsData with _$SettingsData {
  const factory SettingsData({ required String language })
    = _SettingsData;
}

const _defaultData = SettingsData(language: defaultLanguageCode);

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

  void init() {
    String defaultLang = Intl.systemLocale
      .split('_')[0];

    // print(defaultLang);

    final locales =
      [ for (var i in AppLocalizations.supportedLocales) i.languageCode ];

    if (!locales.contains(defaultLang)) {
      defaultLang = defaultLanguageCode;
    }

    final settings = Hive.box(settingsBoxName);
    final lang = settings
      .get(settingsBoxLangFiled, defaultValue: defaultLang) as String;

    emit(state.copyWith(language: lang));
  }
}
