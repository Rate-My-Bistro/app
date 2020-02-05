import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux/redux.dart';

import 'package:rate_my_bistro/actions/AuthActions.dart';
import 'package:rate_my_bistro/state/AppState.dart';
import 'package:rate_my_bistro/supplemental/Constants.dart';

class LocalStorageMiddleware extends MiddlewareClass<AppState>{

  final SharedPreferences preferences;

  LocalStorageMiddleware(this.preferences);

  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);
    if(action is CheckTokenAction){
      var token = preferences.getString(TOKEN);
      if(token!=null && token.isNotEmpty){
        action.hasTokenCallback();
      }else{
        action.noTokenCallback();
      }
    }
  }
}