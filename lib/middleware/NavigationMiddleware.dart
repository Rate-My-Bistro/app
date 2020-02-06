import 'package:redux/redux.dart';

import '../actions/AuthActions.dart';
import '../state/AppState.dart';
import '../state/Keys.dart';

/// Middleware that navigates through the application
/// triggered by Redux Actions
///
/// TODO: Add /signin, /home/, ...
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///
class NavigationMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is NavigateToRegistrationAction) {
      Keys.navKey.currentState.pushNamed("/signup");
    }

    next(action);
  }
}
