import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rate_my_bistro/state/AppState.dart';
import 'package:rate_my_bistro/pages/MenuListPage.dart';
import 'package:rate_my_bistro/state/Keys.dart';
import 'package:redux/redux.dart';

import 'pages/login/SignInPage.dart';
import 'theme/ThemeData.dart';
import 'model/Menu.dart';

/// Entrypoint for the Bistro App
///
/// It creates the initial state abd builds
/// the homepage
///
/// @author Ansgar Sachs ansgar.sa@googlemail.com
/// @since  1.0.0
///
class BistroApp extends StatefulWidget {
  final Store<AppState> store;
  final String title;

  BistroApp(this.store, this.title);

  @override
  _BistroAppState createState() => _BistroAppState();
}

class _BistroAppState extends State<BistroApp> {
  Category _currentCategory = Category.Home;

  void _onCategoryTap() {}

  @override
  Widget build(BuildContext context) {
    return new  StoreProvider<AppState>(
      store: widget.store,
      child: new MaterialApp(
          title: widget.title,
          theme: bistroTheme,
          home:  MenuListPage(
            currentCategory: _currentCategory,
            onCategoryTap: _onCategoryTap,
          ),
          initialRoute: "/signin",
          navigatorKey: Keys.navKey,
          routes:  <String, WidgetBuilder>{
            "/signin": (BuildContext context) => new SignInPage(),
            "/signup": (BuildContext context) => new SignInPage(),
          }
      ),
    );
  }

/// Maybe not used anymore
///
//  Route<dynamic> _getRoute(RouteSettings settings) {
//    if (settings.name == '/login') {
//      return MaterialPageRoute<void>(
//        settings: settings,
//        builder: (BuildContext context) => LoginPage(),
//        fullscreenDialog: true,
//      );
//    }
//
//    return null;
//  }
}
