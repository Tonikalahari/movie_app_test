import 'package:flutter/material.dart';

import '../models/list_vew_model.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

List favorites = ['Luke Skywalker', 'A New Hope'];

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ListViewModel(
            title: favorites[index],
            icon: Icons.favorite_border_outlined,
          );
        });
  }
}
