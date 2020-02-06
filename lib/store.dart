import 'package:rate_my_bistro/reducers/AppReducer.dart';
import 'package:rate_my_bistro/state/AppState.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'middleware/LocalStorageMiddleware.dart';
import 'middleware/NavigationMiddleware.dart';
import 'middleware/ValidationMiddleware.dart';

/// Creates a Redux Store for maintaining
/// the application state
///
/// Adds additional middleware for validation,
/// persistence and communication
///
/// Fetches any existing state from local storage
///
/// @return store used for maintaining the application's state
///
Future<Store<AppState>> createStore() async {
  var prefs = await SharedPreferences.getInstance();

  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      ValidationMiddleware(),
      LoggingMiddleware.printer(),
      LocalStorageMiddleware(prefs),
      NavigationMiddleware()
    ],
  );
}
