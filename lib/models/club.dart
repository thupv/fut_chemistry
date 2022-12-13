import 'metadata.dart';

class Club {
  int id;
  String shortName;
  int leagueId;
  int rarity;
  String code;

  Club({required this.code, required this.id, required this.shortName, required this.leagueId, required this.rarity});

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      id: json["id"],
      code: json["code"],
      shortName: json["shortName"],
      leagueId: json["leagueId"],
      rarity: json["rarity"],
    );
  }
}
