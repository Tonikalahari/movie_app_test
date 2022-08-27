import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app_test/http/http_model.dart';
import 'package:movie_app_test/http/http_request.dart';

import '../models/list_vew_model.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  CharacterListApi webCharacters = CharacterListApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: webCharacters.getCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DataModelCharacter> characters = snapshot.data as List<DataModelCharacter>;
            if (characters.isNotEmpty) {
              ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  return ListViewModel(title: snapshot.data![index]["name"], icon: Icons.favorite_border_outlined);
                }),
              );
            }
          }
          return const Center(child: CircularProgressIndicator(semanticsLabel: 'Unknown error',));
        });
  }
}
