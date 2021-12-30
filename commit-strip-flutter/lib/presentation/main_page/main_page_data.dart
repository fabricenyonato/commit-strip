import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_page_data.freezed.dart';

enum NavItemId {
  home,
  favorites,
}

@freezed
class NavItemData with _$NavItemData {
  const factory NavItemData({
    required NavItemId id,
    required IconData icon,
    required String label,
  }) = _NavItemData;
}

@freezed
class MainPageData with _$MainPageData {
  const factory MainPageData({
    required NavItemId currentNavId,
  }) = _MainPageData;
}
