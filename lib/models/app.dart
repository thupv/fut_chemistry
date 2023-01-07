class App {
  String appName;
  String description;
  String iconURL;
  String storeURL;
  String appId;

  App({required this.appName, required this.description, required this.iconURL, required this.storeURL, required this.appId});

  factory App.fromJson(Map<String, dynamic> json) {
    return App(
      appName: json["app_name"],
      description: json["description"],
      iconURL: json["icon"],
      storeURL: json["store_link"],
      appId: json["app_id"],
    );
  }
}
