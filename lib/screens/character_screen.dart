// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:movie_app_test/http/http_request.dart';
import 'package:movie_app_test/models/character_model.dart';

import '../database/favorite_database.dart';
import '../models/favorite_model.dart';
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

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder<List<Character>>(
        future: webCharacters.getCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              final List<Character> characters = snapshot.data!;
              return ListView.builder(
                itemCount: characters.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    child: ListViewModel(
                      title: characters[index].name,
                      icon: Icons.favorite_outline,
                    ),
                    onTap: () async {
                      await FavoriteDao.instance
                          .add(Favorit(
                        name: characters[index].name, type: 1,
                      ))
                          .then((value) {
                        final snackBar = SnackBar(
                            content: const Text('Favorito adicionado'),
                            action: SnackBarAction(label: 'Ok',
                            textColor: Colors.white,
                             onPressed: () {}));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
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
