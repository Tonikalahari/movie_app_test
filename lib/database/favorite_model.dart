
class Favorit {
  final int? id;
  final String name;
  

  const Favorit({
     this.id,
    required this.name,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
  @override
  String toString() {
    return 'Favorit{id: $id, name: $name,}';
  }
}
