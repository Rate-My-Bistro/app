import 'package:rate_my_bistro/state/AppState.dart';

import 'AuthReducer.dart';
import 'SignInReducer.dart';

AppState appReducer(AppState state, dynamic action) =>
    new AppState(
        authState: authReducer(state.authState,action),
        signInState: signinReducer(state.signInState,action)
    );