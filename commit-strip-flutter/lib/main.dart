import 'package:commit_strip/core/providers/favorites_bloc.dart';
import 'package:commit_strip/core/providers/settings_bloc.dart';
import 'package:commit_strip/di.dart';
import 'package:commit_strip/domain/entities/post.dart';
import 'package:commit_strip/hive.dart';
import 'package:commit_strip/presentation.dart';
import 'package:commit_strip/vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget _postDetailsRoute(BuildContext context) {
  final args = ModalRoute
    .of(context)!.settings.arguments! as Map<String, dynamic>;

  final posts = args['posts'] as List<Post>;
  final currentPost = args['currentPost'] as Post;

  final currentIndex = posts
    .indexWhere((item) => item.id == currentPost.id);

  return BlocProvider<PostPageBloc>(
    create: (_) => PostPageBloc(
      initialState: PostPageData(
        posts: posts,
        initialIndex: currentIndex == -1 ? 0 : currentIndex,
      ),
      addForiteUseCase: getit()
    ),
    child: const PostPage(),
  );
}

void main() async {
  await initHive();
  initDi();

  final app = MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => SettingsBloc()),
      BlocProvider(create: (_) => getit<FavoritesBloc>()),
      BlocProvider(create: (_) => getit<HomePageBloc>()),
    ],
    child: const App(),
  );

  runApp(app);
}

class App extends StatefulWidget {
  const App({ Key? key })
    : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
            TargetPlatform.android: ZoomPageTransitionsBuilder()
          }
        ),
        brightness: Brightness.dark,
      ),
      home: BlocProvider<MainPageBloc>(
        create: (_) => MainPageBloc(const MainPageData(
          currentNavId: NavItemId.home,
        )),
        child: const MainPage(),
      ),
      routes: const { '/post_details': _postDetailsRoute },
    );
  }

  @override
  void initState() {
    super.initState();

    final settings = context.read<SettingsBloc>()
      ..init();

    context.read<FavoritesBloc>()
      .init(settings.lang);
    
    context.read<HomePageBloc>()
      .init(settings.lang);
  }
}
