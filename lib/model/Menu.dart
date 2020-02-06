import 'package:flutter/foundation.dart';

/// TODO: Move this code into State and ViewModels
///
/// author Ansgar Sachs <ansgar.sachs@cgm.com>

enum Category {
  Home,
  Profile,
  Settings,
  Logout,
}

class Menu {
  const Menu({
    @required this.category,
    @required this.id,
    @required this.isFeatured,
    @required this.name,
    @required this.price,
  })  : assert(category != null),
        assert(id != null),
        assert(isFeatured != null),
        assert(name != null),
        assert(price != null);

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final double price;

  int get assetId => id % 6;

  String get assetName => 'missing_picture_$assetId.jpg';

  String get assetPackage => 'assets/food';

  @override
  String toString() => "$name (id=$id)";
}
