class FlavorConfig {
  final String appName;
  final String apiBaseUrl;
  final Env env;
  FlavorConfig(
      {required this.env, required this.appName, required this.apiBaseUrl});
}

enum Env { dev, prod, qa, staging }