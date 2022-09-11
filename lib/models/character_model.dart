class Character {
  int? id;
  String name;
  int type;

  Character({
    this.id,
    required this.name,
    required this.type,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
    };
  }
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      type: 1,
    
    );
  }

  @override
  String toString() {
    return 'Character{id: $id, name: $name, type: $type}';
  }
}
