import 'package:rate_my_bistro/state/AppState.dart';

import 'AuthReducer.dart';
import 'SignInReducer.dart';

/// Composes all application reducers into one
///
/// @return the composition of all reducers
///
AppState appReducer(AppState state, dynamic action) => new AppState(
    authState: authReducer(state.authState, action),
    signInState: signInReducer(state.signInState, action));
