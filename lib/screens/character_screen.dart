// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:movie_app_test/http/http_request.dart';
import 'package:movie_app_test/screens/favorite_screen.dart';

import '../database/database.dart';
import '../database/favorite_model.dart';
import '../models/list_vew_model.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  CharacterListApi webCharacters = CharacterListApi();

  @override
  void initState() {
    webCharacters.getCharacters();
    super.initState();
  }

  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: webCharacters.getCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              final List characters = snapshot.data!.toList();
              return ListView.builder(
                itemCount: characters.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    child: ListViewModel(
                      title: characters[index]['name'],
                    ),
                    onTap: () async {
                      await FavoriteDao.instance.add(Favorit(
                        name: characters[index]['name'],
                      ));
                      // .then((value) => Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => const FavoriteScreen())));
                    },
                  );
                }),
              );
            }
          }
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        });
  }
}
