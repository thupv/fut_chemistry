class AppConfig {
  final String playerUrl;
  final String nationUrl;
  final String cardUrl;
  final String clubUrl;
  final String leagueUrl;
  final String smallCardUrl;
  final String dbUrl;


  const AppConfig({
    required this.playerUrl,
    required this.nationUrl,
    required this.cardUrl,
    required this.clubUrl,
    required this.leagueUrl,
    required this.smallCardUrl,
    required this.dbUrl
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
        playerUrl: json['playerUrl'],
        nationUrl: json['nationUrl'],
        cardUrl: json['cardUrl'],
        clubUrl: json['clubUrl'],
        leagueUrl: json['leagueUrl'],
        smallCardUrl: json['smallCardUrl'],
        dbUrl: json['dbUrl']
    );
  }
}