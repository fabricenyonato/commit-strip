import 'package:commit_strip/core/providers/settings_bloc.dart';
import 'package:commit_strip/data/data_sources/local/entities/post.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  await Hive.openBox(settingsBoxName);

  Hive.registerAdapter(PostAdapter());
  await Hive.openBox<Post>('posts');
}
