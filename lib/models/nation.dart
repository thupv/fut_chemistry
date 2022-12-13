import 'metadata.dart';

class Nation {
  String name;
  int code;
  String cup;

  Nation({required this.name, required this.code, required this.cup});

  factory Nation.fromJson(Map<String, dynamic> json) {
    return Nation(
      name: json["name"],
      code: json["code"],
      cup: json["cup"],
    );
  }
}
