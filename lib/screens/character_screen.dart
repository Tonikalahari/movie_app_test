import 'package:flutter/material.dart';

import '../models/list_vew_model.dart';

class CharacterScreen extends StatefulWidget {
  CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}
List characters = ['Luke Skywalker','G-3PO','Darth Vader'];
class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: characters.length,
      itemBuilder:(context, index) {
      return ListViewModel(
            title: characters[index],
            icon: Icons.favorite_border_outlined,
          );
    });
  }
}