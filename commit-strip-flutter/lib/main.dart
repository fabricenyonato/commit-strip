import 'package:commit_strip/core/providers/favorites_bloc.dart';
import 'package:commit_strip/core/providers/settings_bloc.dart';
import 'package:commit_strip/di.dart';
import 'package:commit_strip/hive.dart';
import 'package:commit_strip/presentation/home_page/home_page.dart';
import 'package:commit_strip/presentation/home_page/home_page_bloc.dart';
import 'package:commit_strip/vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  await initHive();
  initDi();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingsBloc()),
        BlocProvider(create: (_) => getit<FavoritesBloc>()),
      ],
      child: const _App(),
    );
  }
}

class _App extends StatefulWidget {
  const _App({ Key? key })
    : super(key: key);

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  @override
  Widget build(BuildContext context) {
    final config = context.watch<SettingsBloc>();

    return MaterialApp(
      locale: config.locale,
      localizationsDelegates:
        AppLocalizations.localizationsDelegates,
      supportedLocales:
        AppLocalizations.supportedLocales,
      title: 'Commit Strip',
      theme: ThemeData(
        primarySwatch: primaryColor,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android:
              ZoomPageTransitionsBuilder()
          }
        ),
        brightness: Brightness.dark,
      ),
      home: BlocProvider<HomePageBloc>(
        create: (_) => getit(),
        child: const HomePage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    context.read<FavoritesBloc>()
      .init(context.read<SettingsBloc>().lang);
  }
}
