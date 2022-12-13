class AppConfig {
  final String playerUrl;
  final String nationUrl;
  final String cardUrl;
  final String clubUrl;
  final String leagueUrl;
  final String smallCardUrl;


  const AppConfig({
    required this.playerUrl,
    required this.nationUrl,
    required this.cardUrl,
    required this.clubUrl,
    required this.leagueUrl,
    required this.smallCardUrl
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
        playerUrl: json['playerUrl'],
        nationUrl: json['nationUrl'],
        cardUrl: json['cardUrl'],
        clubUrl: json['clubUrl'],
        leagueUrl: json['leagueUrl'],
        smallCardUrl: json['smallCardUrl']
    );
  }
}