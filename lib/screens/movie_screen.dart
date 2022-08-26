import 'package:flutter/material.dart';
import 'package:movie_app_test/models/list_vew_model.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

List movies = ['A New Hope', 'The Empire Strikes Back', 'Return of The Jedi'];

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListViewModel(
            title: movies[index],
            icon: Icons.favorite_border_outlined,
          );
        });
  }
}
