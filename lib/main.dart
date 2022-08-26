import 'package:flutter/material.dart';
import 'package:movie_app_test/screens/avatar_screen.dart';
import 'package:movie_app_test/screens/favorite_screen.dart';
import 'package:movie_app_test/screens/movie_screen.dart';
import 'screens/character_screen.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MovieAppCharacterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MovieAppCharacterScreen extends StatefulWidget {
  const MovieAppCharacterScreen({Key? key}) : super(key: key);

  @override
  State<MovieAppCharacterScreen> createState() => _MovieAppCharacterScreenState();
}

class _MovieAppCharacterScreenState extends State<MovieAppCharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 2),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(15)),
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                      width: 115,
                      height: 35,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Site Oficial',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AvatarScreen()),
                        );
                      },
                      child: const CircleAvatar(
                        foregroundColor: Colors.black,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiZfk_mBRRAnMVpDjIrMbiU5DUxjWeZ5nqRQ&usqp=CAU'),
                        radius: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DefaultTabController(
              length: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0, left: 2, right: 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      TabBar(
                        indicator: BoxDecoration(
                          color: Colors.green[100],
                          border: Border.all(width: 1, color: Colors.black),
                        ),
                        tabs: [
                          PageSelector(title: 'Filmes'),
                          PageSelector(title: 'Personagens'),
                          PageSelector(title: 'Favoritos'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Center(
                          child: SizedBox(
                            width: 350,
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: TabBarView(children: [
                              const MovieScreen(),
                              CharacterScreen(),
                              FavoriteScreen()
                            ]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PageSelector extends StatefulWidget {
  String title;

  PageSelector({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<PageSelector> createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  bool colorEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      width: 115,
      height: 35,
      child: Center(
        child: Text(
          widget.title,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}
