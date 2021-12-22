import 'package:commit_strip/presentation/post_page/post_page_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPageBloc extends Cubit<PostPageData> {
  PostPageBloc({
    required PostPageData initialState,
  })
    : super(initialState);
}
