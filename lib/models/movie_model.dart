class Movie {
  String? id;
  String name;
  int type;

  Movie({
    this.id,
    required this.name,
    required this.type,
  });
  Map<String, dynamic> toMap() {
    return {
      'id' : id ?? 0,
      'name': name,
      'type' : type,
    };
  }
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      name: json['title'],
      type: 2,
    
    );
  }


  @override
  String toString() {
    return 'Movie{id: $id, name: $name, type: $type}';
  }
}
