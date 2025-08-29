class Pet {
  final String id;
  final String name;
  final String type;
  final int age;
  final String notes;

  Pet({
    required this.id,
    required this.name,
    required this.type,
    required this.age,
    required this.notes,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      age: json['age'],
      notes: json['notes'],
    );
  }
}