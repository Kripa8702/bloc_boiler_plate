enum Environment {
  development,
  staging,
  production,
}

///Dummy enum for flavors with key and value
enum Flavor {
  chocolate,
  vanilla,
  strawberry,
}

extension FlavorExtension on Flavor {
  String get key {
    switch (this) {
      case Flavor.chocolate:
        return 'chocolate';
      case Flavor.vanilla:
        return 'vanilla';
      case Flavor.strawberry:
        return 'strawberry';
      default:
        return 'unknown';
    }
  }

  String get value {
    switch (this) {
      case Flavor.chocolate:
        return 'Chocolate';
      case Flavor.vanilla:
        return 'Vanilla';
      case Flavor.strawberry:
        return 'Strawberry';
      default:
        return 'Unknown Flavor';
    }
  }
}