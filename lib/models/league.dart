import 'metadata.dart';

class League {
  int id;
  String code;
  String name;
  int flagId;

  League({required this.code, required this.id, required this.name, required this.flagId});

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json["id"],
      code: json["code"],
      flagId: json["flagId"],
      name: json["name"],
    );
  }
}
