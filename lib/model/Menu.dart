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
    @required this.date,
    this.userRating,
    this.communityRating
  }) : assert(category != null),
       assert(id != null),
       assert(isFeatured != null),
       assert(name != null),
       assert(price != null),
       assert(date != null);

  final Category category;
  final int id;
  final double userRating;
  final double communityRating;
  final bool isFeatured;
  final String name;
  final double price;
  final DateTime date;

  int get assetId => id % 6;

  String get assetName => 'missing_picture_$assetId.jpg';

  String get assetPackage => 'assets/food';

  @override
  String toString() => "$name (id=$id)";
}
