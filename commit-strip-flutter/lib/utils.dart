import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations locale(BuildContext context) =>
  AppLocalizations.of(context);

Locale currentLocale(BuildContext context) =>
  Localizations.localeOf(context);
