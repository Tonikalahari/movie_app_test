// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_app_test/http/http_client.dart';

final uric = Uri.tryParse('https://swapi.dev/api/people/');

class CharacterListApi {
  Future<List> getCharacters() async {
    final Response response = await client.get(uric!);
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      final List decodedNames = decodedJson['results'];
      return decodedNames;
    } else {
      client.close();
      throw Exception('Failed to load Characters list');
    }
  }
}

final urif = Uri.tryParse('https://swapi.dev/api/films/');

class MovieListApi {
  Future<List> getMovies() async {
    final response = await client.get(urif!);
     if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      final List decodedMovies = decodedJson['results'];
      return decodedMovies;
    } else {
      client.close();
      throw Exception('Failed to load Movies list');
    }
  }
}
