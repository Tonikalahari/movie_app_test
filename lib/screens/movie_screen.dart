import 'package:flutter/material.dart';
import 'package:movie_app_test/database/favorite_model.dart';
import 'package:movie_app_test/http/http_request.dart';
import 'package:movie_app_test/models/list_vew_model.dart';
import 'package:movie_app_test/screens/favorite_screen.dart';

import '../database/database.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  MovieListApi webMovies = MovieListApi();

  @override
  void initState() {
    webMovies.getMovies();
    super.initState();
  }

  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: webMovies.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              final List movies = snapshot.data!.toList();
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    child: ListViewModel(
                      title: movies[index]['title'],
                    ),
                    onTap: () async {
                      await FavoriteDao.instance.add(Favorit(
                        name: movies[index]['title'],
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
