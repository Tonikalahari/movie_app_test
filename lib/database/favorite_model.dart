class Favorit {
  int? id;
  String name;
  int type;

  Favorit({
    this.id,
    required this.name,
    required this.type,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type' : type,
    };
  }

  @override
  String toString() {
    return 'Favorit{id: $id, name: $name, type: $type}';
  }
}
