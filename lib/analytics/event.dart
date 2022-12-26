import 'package:firebase_analytics/firebase_analytics.dart';

import '../models/player.dart';

Future logFilter(String filterType, String filterValue) async {
  await FirebaseAnalytics.instance.logEvent(
    name: "player_filter",
    parameters: {
      "filter_type": filterType,
      "filter_value": filterValue,
    },
  );
}

Future logImportSquad(String squadId) async {
  await FirebaseAnalytics.instance.logEvent(
    name: "import_squad",
    parameters: {
      "squad_id": squadId,
    },
  );
}

Future logOptimize(List<Player> players) async {
  await FirebaseAnalytics.instance.logEvent(
    name: "start_optimize",
    parameters: {
      "players": players.map((p) => p.indexKey).join(","),
    },
  );
}

Future logViewSquad(int index) async {
  await FirebaseAnalytics.instance.logEvent(
    name: "view_optimized_squad",
    parameters: {
      "squad_index": index.toString(),
    },
  );
}

Future logAdImpression() async {
  await FirebaseAnalytics.instance.logEvent(
    name: "ad_impression",
  );
}