// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'package:movie_app_test/models/character_model.dart';
import 'package:movie_app_test/models/favorite_model.dart';
import 'package:movie_app_test/models/movie_model.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteDao {
  FavoriteDao._privateConstroctor();
  static final FavoriteDao instance = FavoriteDao._privateConstroctor();

  static Database? _database;
  //o operador ??= atribui o valor apenas se for nulo
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'apptest.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE favoriteTable(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, type INTEGER)');
  }

  Future<void> add(Favorit favorit) async {
    Database db = await instance.database;
    db.insert(
      'favoriteTable',
      favorit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Favorit>> getFavorit() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favoriteTable');

    return List.generate(maps.length, (i) {
      return Favorit(
        id: maps[i]['id'],
        name: maps[i]['name'],
        type: maps[i]['type']
      );
    });
  }


  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('favoriteTable', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> addMovieFromApi(Movie movie) async {
    Database db = await instance.database;
    db.insert(
      'favoriteTable',
      movie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Movie>> getMovie() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favoriteTable');

    return List.generate(maps.length, (i) {
      return Movie(
        id: maps[i]['id'],
        name: maps[i]['name'],
        type: maps[i]['type']
      );
    });
  }

  Future<void> addCharacterFromApi(Character character) async {
    Database db = await instance.database;
    db.insert(
      'favoriteTable',
      character.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Character>> getCharacter() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favoriteTable');

    return List.generate(maps.length, (i) {
      return Character(
        id: maps[i]['id'],
        name: maps[i]['name'],
        type: maps[i]['type']
      );
    });
  }
}
