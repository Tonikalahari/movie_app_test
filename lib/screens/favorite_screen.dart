import 'package:flutter/material.dart';
import 'package:movie_app_test/database/favorite_model.dart';

import '../models/list_vew_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Favorites>>(
        future: DataBaseHelper.instance.getFavorites(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            List favorites = snapshot.data!.toList();
            return ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return ListViewModel(
                    title: favorites[index],
                    onPressed: () {},
                  );
                });
          }
          return const CircularProgressIndicator(
            color: Colors.white,
          );
        });
  }
}
