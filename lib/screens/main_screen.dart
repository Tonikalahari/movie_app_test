import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';

import 'character_screen.dart';
import 'favorite_screen.dart';
import 'movie_screen.dart';

class MovieAppCharacterScreen extends StatefulWidget {
  const MovieAppCharacterScreen({Key? key}) : super(key: key);

  @override
  State<MovieAppCharacterScreen> createState() => _MovieAppCharacterScreenState();
}

class _MovieAppCharacterScreenState extends State<MovieAppCharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 2),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all( Radius.circular(5)),
                          border: Border.all(width: 1, color: Colors.white),
                        ),
                        width: 115,
                        height: 35,
                        child: TextButton(
                            onPressed: () {Navigator.pushNamed(
                            context,
                            'site'
                          );},
                            child: const Text(
                              'Site Oficial',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            'avatar',
                          );
                        },
                        child:FluttermojiCircleAvatar(
                        backgroundColor: Colors.grey[800],
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
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                      color: Colors.transparent,
                      border: Border.all(width: 1, color: Colors.white),
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        TabBar(
                          indicator: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                            color: Colors.white.withOpacity(0.5),
                            border: Border.all(width: 1, color: Colors.white),
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
                              height: MediaQuery.of(context).size.height * 0.75,
                              child: const TabBarView(children: [
                                MovieScreen(),
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
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
