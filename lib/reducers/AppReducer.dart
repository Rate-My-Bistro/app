import 'package:rate_my_bistro/reducers/AuthReducer.dart';
import 'package:rate_my_bistro/reducers/SignInReducer.dart';
import 'package:rate_my_bistro/state/AppState.dart';

/// Composes all application reducers into one
///
/// @return the composition of all reducers
///
AppState appReducer(AppState state, dynamic action) => new AppState(
    authState: authReducer(state.authState, action),
    signInState: signInReducer(state.signInState, action),
    menuState: state.menuState,
    category: state.category
);
