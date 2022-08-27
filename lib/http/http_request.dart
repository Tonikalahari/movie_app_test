import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_app_test/http/http_model.dart';
import 'package:movie_app_test/http/http_client.dart';

final uri = Uri.tryParse('https://swapi.dev/api/people/');

class CharacterListApi {
  Future<List<DataModelCharacter>> getCharacters() async {
    final Response response = await client.get(uri!);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return decodedJson
        .map((dynamic json) => DataModelCharacter.fromJson(json))
        .toList();
    } else {
      throw Exception('Failed to load Characters list');
    }
  }
}

class MovieListApi {
  Future<DataModelMovies> getMovies() async {
    final response = await client.get(
      Uri.tryParse('https://swapi.dev/api/films/')!,
    );
    if (response.statusCode == 200) {
      return DataModelMovies.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Movies list');
    }
  }
}
