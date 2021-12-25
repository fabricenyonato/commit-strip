import 'package:commit_strip/core/data_state.dart';
import 'package:commit_strip/domain/entities/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_data.freezed.dart';

@freezed
class HomePageData with _$HomePageData {
  const factory HomePageData({
    required DataState<List<Post>> posts,
    required bool isFavorites,
    required String lang,
  })
    = _HomePageData;
}
