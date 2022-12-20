import 'package:hive/hive.dart';

// Define the Hive model class
@HiveType(typeId: 0)
class Team {
  @HiveField(0)
  String name;
  @HiveField(1)
  List<String> playerIds;

  Team({required this.name, required this.playerIds});
}