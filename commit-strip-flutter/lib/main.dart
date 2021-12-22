import 'package:commit_strip/di.dart';
import 'package:commit_strip/presentation/home_page/home_page.dart';
import 'package:commit_strip/presentation/home_page/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  initDi();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      primarySwatch: Colors.blueGrey,
      textTheme: GoogleFonts.montserratTextTheme(),
    );

    return MaterialApp(
      title: 'Commit Strip',
      theme: theme,
      home: BlocProvider<HomePageBloc>(
        create: (_) => getit(),
        child: const HomePage(),
      ),
    );
  }
}
