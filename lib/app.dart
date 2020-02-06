import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rate_my_bistro/pages/MenuDetailPage.dart';
import 'package:rate_my_bistro/state/AppState.dart';
import 'package:rate_my_bistro/pages/MenuListPage.dart';
import 'package:rate_my_bistro/state/Keys.dart';
import 'package:redux/redux.dart';

import 'pages/login/SignInPage.dart';
import 'theme/ThemeData.dart';
import 'model/Menu.dart';

/// Builder for the Bistro application
///
/// It composes all existing routes and
/// sets the theme
///
/// @author Ansgar Sachs ansgar.sa@googlemail.com
///
class BistroApp extends StatefulWidget {
  final Store<AppState> store;
  final String title;

  BistroApp(this.store, this.title);

  @override
  _BistroAppState createState() => _BistroAppState();
}

/// UI Builder for the Bistro Application
///
/// @author Ansgar Sachs ansgar.sa@googlemail.com
///
class _BistroAppState extends State<BistroApp> {
  Category _currentCategory = Category.Home;

  /// Handles a new Category selection
  ///
  /// TODO: Implement/Remove Stub method
  ///
  void _onCategoryTap() {}

  /// Builds the underlying MaterialApp and
  /// connects it with the application's store
  ///
  /// Sets up all existing application routes
  ///
  /// @return bistro app widget
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: widget.store,
      child: new MaterialApp(
          title: widget.title,
          theme: BistroDesign.theme,
          home: MenuListPage(
            // TODO: get rid of these injection with Redux
            currentCategory: _currentCategory,
            onCategoryTap: _onCategoryTap,
          ),
          initialRoute: "/signin",
          navigatorKey: Keys.navKey,
          routes: <String, WidgetBuilder>{
            "/signin": (BuildContext context) => new SignInPage(),
            "/signup": (BuildContext context) => new SignInPage(),
            "/home": (BuildContext context) => new MenuListPage(
                  // TODO: get rid of these injections with Redux
                  currentCategory: _currentCategory,
                  onCategoryTap: _onCategoryTap,
                ),
            "/detail": (BuildContext context) => new MenuDetailPage(
                // TODO: get rid of these injections with Redux
                currentCategory: _currentCategory,
                onCategoryTap: _onCategoryTap,
                menu: null)
          }),
    );
  }
}
