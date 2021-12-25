import 'package:commit_strip/domain/use_cases/add_favorite_use_case.dart';
import 'package:commit_strip/presentation/post_page/post_page_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPageBloc extends Cubit<PostPageData> {
  final AddForiteUseCase addForiteUseCase;

  PostPageBloc({
    required PostPageData initialState,
    required this.addForiteUseCase,
  })
    : super(initialState);
}
