import 'package:flutter/material.dart';
import 'package:rate_my_bistro/pages/MenuListPage.dart';

import 'pages/LoginPage.dart';
import 'theme/ThemeData.dart';
import 'model/Menu.dart';

/// Creates a new Material Stateful Widget
///
/// @author Ansgar Sachs ansgar.sa@googlemail.com
/// @since  1.0.0
///
class BistroApp extends StatefulWidget {
  @override
  _BistroAppState createState() => _BistroAppState();
}

/// Creates a new Material App
///
/// @author Ansgar Sachs ansgar.sa@googlemail.com
/// @since  1.0.0
///
class _BistroAppState extends State<BistroApp> {
  Category _currentCategory = Category.Home;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rate my Bistro',
      home: MenuListPage(
        currentCategory: _currentCategory,
        onCategoryTap: _onCategoryTap,
      ),
      theme: bistroTheme,
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name == '/login') {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => LoginPage(),
        fullscreenDialog: true,
      );
    }

    return null;
  }
}
