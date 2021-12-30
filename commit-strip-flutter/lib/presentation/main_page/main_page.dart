import 'package:commit_strip/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({ Key? key })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<MainPageBloc>();

    return MainPageView(
      data: bloc.state,
      child: _buildChild(bloc.state.currentNavId),
      onNavTap: (id) => bloc.currentNavId = id,
    );
  }

  _buildChild(NavItemId currentNavId) {
    if (currentNavId == NavItemId.favorites) {
      return const FavoritesPage();
    }

    return const HomePage();
  }
}
