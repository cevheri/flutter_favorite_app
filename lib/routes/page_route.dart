import 'package:flutter/material.dart';
import 'package:flutter_favorite_app/presentation/screen/favorite_page.dart';
import 'package:flutter_favorite_app/presentation/screen/home_page.dart';

/// routes in flutter are used to navigate from one screen to another
Map<String, WidgetBuilder> get routes {
  return {
    'default': (context) => MyHomePage(), // default route
    '/': (context) => MyHomePage(),
    '/favorites': (context) => FavoritePage(),
  };
}
