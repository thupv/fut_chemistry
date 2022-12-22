import 'package:interpolation/interpolation.dart';

import 'app_config.dart';

class Player {
  String playerId;
  String playerName;
  String rarity;
  String smallRarity;
  String playerImg;
  String league;
  String leagueId;
  String leagueName;

  String club;
  String clubId;
  String clubName;

  String nation;
  String nationId;
  String nationName;
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
  bool isSpecial = true;

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
      this.nationName = "France",
      this.leagueId = "League 1",
      this.leagueName = "League 1",
      this.clubId = "PSG",
      this.clubName = "PSG",
      this.position = "CAM|CF",
      this.firstPosition = "CAM",
      this.rating = "98",
      this.rarityId = "GOLD",
      this.stats = const ["99", "99", "99", "99", "99", "99"],
      this.bgColor = "#fff",
      this.borderColor = "#000",
      this.textColor = "#fff",
      this.cardImg = "gold12",
      this.probality = "0",
      this.isSpecial = true});

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
    bool isSpecial = ![0, 1, 2, 12, 47, 48, 53, 54, 128].contains(csvData[15]);

    String playerImgUrl = interpolation.eval(appConfig.playerUrl,
        {'playerId': isSpecial ? ('p${csvData[26]}') : csvData[0]});

    String cardId = '1_${csvData[15]}_0';
    if (csvData[25] == 1) {
      if (csvData[2] > 74) {
        cardId = '1_${csvData[15]}_3';
      } else if (csvData[2] > 64) {
        cardId = '1_${csvData[15]}_2';
      } else {
        cardId = '1_${csvData[15]}_1';
      }
    }

    String rarityUrl =
        interpolation.eval(appConfig.cardUrl, {'cardId': cardId});

    String smallRarityUrl =
        interpolation.eval(appConfig.smallCardUrl, {'cardId': cardId});

    String nationUrl =
        interpolation.eval(appConfig.nationUrl, {'nationId': csvData[22]});

    String clubUrl =
        interpolation.eval(appConfig.clubUrl, {'clubId': csvData[20]});

    String leagueUrl =
        interpolation.eval(appConfig.leagueUrl, {'leagueId': csvData[21]});

    String firstPosition = csvData[3].split('|')[0];

    String playerName = csvData[1] != '' ? csvData[1] : "---";

    return Player(
        playerId: csvData[0].toString(),
        playerName: playerName,
        smallRarity: smallRarityUrl,
        rarity: rarityUrl,
        rarityId: csvData[15].toString(),
        playerImg: playerImgUrl,
        nationId: csvData[22].toString(),
        leagueId: csvData[21].toString(),
        clubId: csvData[20].toString(),
        nation: nationUrl,
        league: leagueUrl,
        club: clubUrl,
        nationName: csvData[6],
        leagueName: csvData[5],
        clubName: csvData[4],
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
        cardImg: rarityUrl,
        isSpecial: isSpecial);
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

  get indexKey {
    return "${playerId}_$rarityId";
  }
}
