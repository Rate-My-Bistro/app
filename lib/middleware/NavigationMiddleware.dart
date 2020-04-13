import 'package:rate_my_bistro/actions/AuthActions.dart';
import 'package:rate_my_bistro/state/AppState.dart';
import 'package:rate_my_bistro/state/Keys.dart';
import 'package:redux/redux.dart';

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
    
    if (action is NavigateToHomeAction) {
      Keys.navKey.currentState.pushNamed("/home");
    }

    next(action);
  }
}
