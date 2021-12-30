import 'package:flutter/material.dart';

const _primaryColorValue = 0xFF2B3F6B;
const primaryColor = MaterialColor(
  _primaryColorValue,
  {
    50: Color(0xFFE6E8ED),
    100: Color(0xFFBFC5D3),
    200: Color(0xFF959FB5),
    300: Color(0xFF6B7997),
    400: Color(0xFF4B5C81),
    500: Color(_primaryColorValue),
    600: Color(0xFF263963),
    700: Color(0xFF203158),
    800: Color(0xFF1A294E),
    900: Color(0xFF101B3C),
  }
);

const _accentColorValue = 0xFF456DFF;
const accentColor = MaterialColor(
  _accentColorValue,
  {
    100: Color(0xFF7895FF),
    200: Color(_accentColorValue),
    400: Color(0xFF1245FF),
    700: Color(0xFF0035F7),
  }
);

const defaultLanguageCode = 'en';
