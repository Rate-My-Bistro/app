import 'package:rate_my_bistro/actions/AuthActions.dart';
import 'package:rate_my_bistro/state/AppState.dart';
import 'package:rate_my_bistro/state/Keys.dart';
import 'package:redux/redux.dart';

class NavigationMiddleware extends MiddlewareClass<AppState>{
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if(action is NavigateToRegistrationAction){
      Keys.navKey.currentState.pushNamed("/signup");
    }
    next(action);
  }
}