import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:commit_strip/presentation.dart';

class MainPageBloc extends Cubit<MainPageData> {
  MainPageBloc(initialState)
    : super(initialState);

  set currentNavId(NavItemId value) =>
    emit(state.copyWith(currentNavId: value));
}
