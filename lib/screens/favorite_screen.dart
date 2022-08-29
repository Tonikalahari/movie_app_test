import 'package:flutter/material.dart';
import 'package:movie_app_test/database/favorite_model.dart';

import '../database/database.dart';
import '../models/list_vew_model.dart';

// ignore: must_be_immutable
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Favorit>>(
        future: FavoriteDao.instance.getFavorit(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            List favorites = snapshot.data!;
            // ignore: avoid_print
            print('===========>${favorites.toString()}');
            return ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return ListViewModel(
                    title: favorites.toString(),
                    icon: Icons.favorite,
                  );
                });
          }
          return const Center(
              child: Text(
            'Adicione um novo Favorito',
            style: TextStyle(
              color: Colors.white,
            ),
          ));
        });
  }
}
