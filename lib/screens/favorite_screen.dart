import 'package:flutter/material.dart';
import 'package:movie_app_test/models/favorite_model.dart';

import '../database/favorite_database.dart';
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
            // o resultado deve ser tipado para que possamos acessar seus atributos.
            List<Favorit> favorites = snapshot.data!;
            return ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      setState(() {
                        FavoriteDao.instance.remove(favorites[index].id!).then((value) {
                          final snackBar = SnackBar(
                              content: const Text('Favorito removido'),
                              action: SnackBarAction(
                                  label: 'Ok', textColor: Colors.white, onPressed: () {}));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                        context.widget;
                      });
                    },
                    child: ListViewModel(
                      title: favorites[index].name,
                      icon: Icons.favorite,
                      color: favorites[index].type == 1 ? Colors.green : Colors.red,
                    ),
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
