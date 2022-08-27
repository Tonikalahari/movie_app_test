import 'dart:convert';

class DataModelCharacter {
  String name;
  DataModelCharacter({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
    };
  }

  factory DataModelCharacter.fromMap(Map<String, dynamic> map) {
    return DataModelCharacter(
      name: map["name"],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModelCharacter.fromJson(String source) =>
      DataModelCharacter.fromMap(json.decode(source));
}

class DataModelMovies {
  String title;
  DataModelMovies({
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  factory DataModelMovies.fromMap(Map<String, dynamic> map) {
    return DataModelMovies(
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModelMovies.fromJson(String source) => DataModelMovies.fromMap(json.decode(source));
}
