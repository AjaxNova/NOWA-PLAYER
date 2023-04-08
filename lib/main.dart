import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nova_videoplayer/functions/new_playlist_class.dart';
import 'package:nova_videoplayer/screen/splash_screen.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!Hive.isAdapterRegistered(PlaylistAdapter().typeId)) {
    Hive.registerAdapter(PlaylistAdapter());
  }
  await Hive.initFlutter();

  await Hive.openBox<String>('videoHistory');

  await Hive.openBox<String>('FavoriteDB');

  await Hive.openBox<Playlist>('playlistDb');

  runApp(const Nova());
}

class Nova extends StatelessWidget {
  const Nova({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const SplashScreen(),
    );
  }
}
