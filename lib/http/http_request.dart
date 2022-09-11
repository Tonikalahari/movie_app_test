// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_app_test/models/character_model.dart';
import 'package:movie_app_test/http/http_client.dart';
import '../models/movie_model.dart';

final uric = Uri.tryParse('https://swapi.dev/api/people/');

class CharacterListApi {
  Future<List<Character>> getCharacters() async {
    final Response response = await client.get(uric!);
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      final decodedNames = decodedJson['results'];
      return decodedNames.map<Character>((json) => Character.fromJson(json)).toList();
    } else {
      client.close();
      throw Exception('Failed to load Characters list');
    }
  }
}

final urif = Uri.tryParse('https://swapi.dev/api/films/');

class MovieListApi {
  Future<List<Movie>> getMovies() async {
    final response = await client.get(urif!);
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      final decodedMovies = decodedJson['results'];
      return decodedMovies.map<Movie>((json) => Movie.fromJson(json)).toList();
    } else {
      client.close();
      throw Exception('Failed to load Movies list');
    }
  }
}
