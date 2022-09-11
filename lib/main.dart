import 'package:flutter/material.dart';
import 'package:movie_app_test/screens/avatar_screen.dart';
import 'package:movie_app_test/screens/character_screen.dart';
import 'package:movie_app_test/screens/favorite_screen.dart';
import 'package:movie_app_test/screens/main_screen.dart';
import 'package:movie_app_test/models/site_screen.dart';
import 'package:movie_app_test/screens/movie_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home',
      routes: {
        'home': (context) => const MovieAppCharacterScreen(),
        'site': (context) => const SiteScreen(),
        'avatar':(context) => const AvatarScreen(),
        'movie' :(context) => const MovieScreen(),
        'character' : (context) => const CharacterScreen(),
        'favorites':(context) => const FavoriteScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

