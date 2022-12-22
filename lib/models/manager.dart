import 'metadata.dart';

class Manager {
  String name;
  int nationId;

  Manager({required this.name, required this.nationId});

  factory Manager.fromJson(Map<String, dynamic> json) {
    return Manager(
      name: json["name"],
      nationId: json["nation"],
    );
  }
}
