import 'package:interpolation/interpolation.dart';

import 'app_config.dart';

class Player {
  String playerId;
  String playerName;
  String rarity;
  String smallRarity;
  String playerImg;
  String nation;
  String league;
  String leagueId;
  String club;
  String clubId;
  String nationId;
  String position;
  String rating;
  String rarityId;
  List<String> stats;
  String bgColor;
  String borderColor;
  String textColor;
  String cardImg;
  String firstPosition;
  String probality;

  Player(
      {this.playerId = "1",
      this.playerName = "Ronaldo",
      this.rarity = "assets/img/cards/gold.png",
      this.smallRarity = "assets/img/cards/gold.png",
      this.playerImg =
          "https://futhead.cursecdn.com/static/img/22/players/20801.png",
      this.nation = "https://futhead.cursecdn.com/static/img/19/nations/38.png",
      this.league = "https://futhead.cursecdn.com/static/img/19/clubs/45.png",
      this.club = "https://futhead.cursecdn.com/static/img/19/clubs/45.png",
      this.nationId = "France",
      this.leagueId = "League 1",
      this.clubId = "PSG",
      this.position = "CAM|CF",
      this.firstPosition = "CAM",
      this.rating = "98",
      this.rarityId = "GOLD",
      this.stats = const ["99", "99", "99", "99", "99", "99"],
      this.bgColor = "#fff",
      this.borderColor = "#000",
      this.textColor = "#fff",
      this.cardImg = "gold12",
      this.probality = "0"});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      playerName: json["player_name"],
      rarity: json["rarity"],
      playerImg: json["playerImg"],
      nation: json["nation"],
      league: json["league"],
      club: json["club"],
      position: json["position"],
      rating: json["rating"],
    );
  }

  factory Player.fromCSV(List<dynamic> csvData, AppConfig appConfig) {
    var interpolation = Interpolation();

    // var playerImgUrl = "https://futhead.cursecdn.com/static/img/21/players/${csvData[15]}.png";
    // if(csvData[15].toString().length == 0) {
    //   playerImgUrl = "https://futhead.cursecdn.com/static/img/21/players/203747.png";
    // } else if(csvData[15].toString()[0] == "p") {
    //   playerImgUrl = "https://futhead.cursecdn.com/static/img/21/players_alt/${csvData[15]}.png";
    // }
    String playerImgUrl = interpolation.eval(appConfig.playerUrl,
        {'playerId': csvData[0] != "" ? csvData[0] : csvData[4]});

    String rarityUrl =
        interpolation.eval(appConfig.cardUrl, {'cardId': csvData[19]});

    String smallRarityUrl =
        interpolation.eval(appConfig.smallCardUrl, {'cardId': csvData[19]});

    String nationUrl =
        interpolation.eval(appConfig.nationUrl, {'nationId': csvData[22]});

    String clubUrl =
        interpolation.eval(appConfig.clubUrl, {'clubId': csvData[20]});

    String leagueUrl =
        interpolation.eval(appConfig.leagueUrl, {'leagueId': csvData[21]});

    String firstPosition = csvData[3].split(',')[0];

    return Player(
        playerId: csvData[0].toString(),
        playerName: csvData[1],
        smallRarity: smallRarityUrl,
        rarity: rarityUrl,
        rarityId: csvData[15],
        playerImg: playerImgUrl,
        nationId: csvData[22].toString(),
        leagueId: csvData[21].toString(),
        clubId: csvData[20].toString(),
        nation: nationUrl,
        league: leagueUrl,
        club: clubUrl,
        position: csvData[3],
        firstPosition: firstPosition,
        rating: csvData[2].toString(),
        stats: [
          csvData[7].toString(),
          csvData[8].toString(),
          csvData[9].toString(),
          csvData[10].toString(),
          csvData[11].toString(),
          csvData[12].toString(),
          csvData[13].toString(),
          csvData[14].toString()
        ],
        borderColor: csvData[16],
        bgColor: csvData[17],
        textColor: csvData[18],
        probality: csvData[23].toString(),
        cardImg: rarityUrl);
  }

  Map<String, dynamic> toJson() => {
        "playerName": playerName,
        "rarity": rarity,
        "playerImg": playerImg,
        "nation": nation,
        "league": league,
        "club": club,
        "position": position,
        "stats": stats,
        "borderColor": borderColor,
        "bgColor": bgColor,
        "textColor": textColor,
      };

  String toString() {
    return "$bgColor|$borderColor|$textColor|$cardImg|$playerName|$rarity|$playerImg|$nation|$league|$club|$position|$rating|${stats[0]}|${stats[1]}|${stats[2]}|${stats[3]}|${stats[4]}|${stats[5]}";
  }
}
