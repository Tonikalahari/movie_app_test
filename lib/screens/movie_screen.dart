import 'package:flutter/material.dart';
import 'package:movie_app_test/database/favorite_model.dart';
import 'package:movie_app_test/http/http_request.dart';
import 'package:movie_app_test/models/list_vew_model.dart';

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
                      icon:  Icons.favorite_outline,
                    ),
                    onTap: () async {
                      await FavoriteDao.instance
                          .add(Favorit(
                        name: movies[index]['title'], type: 2,
                      ))
                          .then((_) {  
                        final snackBar = SnackBar(
                            content: const Text('Favorito adicionado'),
                            action: SnackBarAction(
                                label: 'Ok', textColor: Colors.white, onPressed: () {}));
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
