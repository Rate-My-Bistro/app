import 'package:rate_my_bistro/actions/AuthActions.dart';
import 'package:rate_my_bistro/actions/AuthRequest.dart';
import 'package:rate_my_bistro/state/AppState.dart';
import 'package:rate_my_bistro/state/LoadingStatus.dart';
import 'package:rate_my_bistro/state/ScreenState.dart';
import 'package:rate_my_bistro/values/English.dart';
import 'package:redux/redux.dart';

/// Middleware that validates any given user input
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///
class ValidationMiddleware extends MiddlewareClass<AppState> {
  final String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is ValidateEmailAction) {
      validateEmail(action.screenState, action.email, next);
    }

    if (action is ValidatePasswordAction) {
      validatePassword(action.screenState, action.password, next);
    }

    if (action is ValidatePasswordMatchAction) {
      validatePassMatch(
          action.screenState, action.password, action.confirmPassword, next);
    }

    if (action is ValidateCodeAction) {
      if (isNumeric(action.code) && action.code.length >= 6) {
        next(new CodeErrorAction(""));
      } else {
        next(CodeErrorAction(code_error));
      }
    }

    if (action is ValidateLoginFields) {
      validateEmail(ScreenState.SIGNIN, action.email, next);
      validatePassword(ScreenState.SIGNIN, action.password, next);
      RegExp exp = new RegExp(emailPattern);
      if (!exp.hasMatch(action.email) || action.password.length < 6) {
        next(ChangeLoadingStatusAction(LoadingStatus.ERROR));
      } else {
        next(new SignInAction(new AuthRequest(action.email, action.password)));
      }
    }
    if (action is ValidateSignUpFieldsAction) {
      validateEmail(ScreenState.SIGNUP, action.request.email, next);
      validatePassword(ScreenState.SIGNUP, action.request.password, next);
      validatePassMatch(ScreenState.SIGNUP, action.request.password,
          action.request.retypePassword, next);
      RegExp exp = new RegExp(emailPattern);
      if (!exp.hasMatch(action.request.email) ||
          action.request.password.length < 6 ||
          action.request.password != action.request.retypePassword) {
        next(ChangeLoadingStatusAction(LoadingStatus.ERROR));
      } else {
        next(new SignUpAction(action.request));
      }
    }
    next(action);
  }

  void validatePassMatch(ScreenState screen, String password,
      String confirmPassword, NextDispatcher next) {
    if (password != confirmPassword) {
      next(new RetypePasswordErrorAction(password_match_error, screen));
    } else {
      next(new RetypePasswordErrorAction("", screen));
    }
  }

  void validatePassword(
      ScreenState screen, String password, NextDispatcher next) {
    if (password.length < 6) {
      next(new PasswordErrorAction(password_error, screen));
    } else {
      next(new PasswordErrorAction("", screen));
    }
  }

  void validateEmail(ScreenState screen, String email, NextDispatcher next) {
    RegExp exp = new RegExp(emailPattern);
    if (!exp.hasMatch(email)) {
      next(new EmailErrorAction(email_error, screen));
    } else {
      next(new EmailErrorAction("", screen));
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }
}
