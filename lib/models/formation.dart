class Formation {
  int id;
  String name;
  List<String> positions;
  List<List<double>> offsets;

  Formation({required this.id, required this.name, required this.positions, required this.offsets});

  factory Formation.fromJson(Map<String, dynamic> json) {
    return Formation(
      id: json["id"],
      name: json["name"],
      positions: json["positions"],
      offsets: json["offsets"],
    );
  }
}