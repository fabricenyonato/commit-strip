import 'package:commit_strip/domain/entities/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_page_data.freezed.dart';

@freezed
class PostPageData with _$PostPageData {
  const factory PostPageData({
    required List<Post> posts,
    required int initialIndex,
  })
    = _PostPageData; 
}
