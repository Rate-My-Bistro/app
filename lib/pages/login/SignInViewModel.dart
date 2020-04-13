import 'package:rate_my_bistro/actions/AuthActions.dart';
import 'package:rate_my_bistro/state/AppState.dart';
import 'package:rate_my_bistro/state/LoadingStatus.dart';
import 'package:rate_my_bistro/state/ScreenState.dart';
import 'package:redux/redux.dart';

/// ViewModel of the SignIn Page
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///
class SignInViewModel {
  final LoadingStatus status;
  final ScreenState type;
  final String password;
  final String passwordError;
  final String email;
  final String emailError;

  final Function(String) validateEmail;
  final Function(String) validatePassword;
  final Function(String email, String password) login;
  final Function clearError;
  final Function navigateToRegistration;
  final Function navigateToHome;

  SignInViewModel({
    this.status,
    this.type,
    this.password,
    this.passwordError,
    this.email,
    this.emailError,
    this.validateEmail,
    this.validatePassword,
    this.login,
    this.clearError,
    this.navigateToRegistration,
    this.navigateToHome
  });

  static SignInViewModel fromStore(Store<AppState> store) {
    return SignInViewModel(
        status: store.state.signInState.loadingStatus,
        type: store.state.signInState.type,
        email: store.state.signInState.email,
        emailError: store.state.signInState.emailError,
        password: store.state.signInState.password,
        passwordError: store.state.signInState.passwordError,
        validateEmail: (email) =>
            store.dispatch(new ValidateEmailAction(email, ScreenState.SIGNIN)),
        validatePassword: (password) => store
            .dispatch(new ValidatePasswordAction(password, ScreenState.SIGNIN)),
        login: (email, password) {
          store.dispatch(new ValidateLoginFields(email, password));
        },
        clearError: () => store.dispatch(new ClearErrorsAction()),
        navigateToHome: () => store.dispatch(new NavigateToHomeAction()),
        navigateToRegistration: () =>
            store.dispatch(new NavigateToRegistrationAction()));
  }
}
