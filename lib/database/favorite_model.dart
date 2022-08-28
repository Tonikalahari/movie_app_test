import 'dart:async';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class Movies {
  final int? id;
  final String title;

  Movies(this.id, this.title);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory Movies.fromMap(Map<String, dynamic> map) {
    return Movies(
      map['id'],
      map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movies.fromJson(String source) => Movies.fromMap(json.decode(source));
}

class Characters {
  final int? id;
  final String name;

  Characters({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Characters.fromMap(Map<String, dynamic> map) {
    return Characters(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Characters.fromJson(String source) => Characters.fromMap(json.decode(source));
}

class Favorites {
  final int? id;
  final String name;

  Favorites(this.id, this.name);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Favorites.fromMap(Map<String, dynamic> map) {
    return Favorites(
      map['id'],
      map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorites.fromJson(String source) => Favorites.fromMap(json.decode(source));
}

class DataBaseHelper {
  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('apptest.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE favoritos(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL
)
''');
  }

  Future<List<Favorites>> getFavorites() async {
    Database db = await instance.database;
    var favorites = await db.query('favoritos', orderBy: 'name');
    List<Favorites> favoritesList =
        favorites.isNotEmpty ? favorites.map((e) => Favorites.fromMap(e)).toList() : [];

    return favoritesList;
  }

  Future<int> addFavorite(Favorites favorite) async {
    Database db = await instance.database;
    return await db.insert('favoritos', favorite.toMap());
  }
}
