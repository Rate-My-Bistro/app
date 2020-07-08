import 'dart:ui';

import 'package:rate_my_bistro/actions/AuthRequest.dart';
import 'package:rate_my_bistro/actions/SignUpRequest.dart';
import 'package:rate_my_bistro/state/LoadingStatus.dart';
import 'package:rate_my_bistro/state/ScreenState.dart';

/// Collection of all triggers to change the auth state
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///

class ValidateEmailAction {
  final String email;
  final ScreenState screenState;

  ValidateEmailAction(this.email, this.screenState);
}

class ValidatePasswordAction {
  final String password;
  final ScreenState screenState;

  ValidatePasswordAction(this.password, this.screenState);
}

class ValidateLoginFields {
  final String email;
  final String password;

  ValidateLoginFields(this.email, this.password);
}

class ValidatePasswordMatchAction {
  final String password;
  final String confirmPassword;
  final ScreenState screenState;

  ValidatePasswordMatchAction(
      this.password, this.confirmPassword, this.screenState);
}

class ValidateSignUpFieldsAction {
  final SignUpRequest request;

  ValidateSignUpFieldsAction(this.request);
}

class ValidateCodeAction {
  final String code;

  ValidateCodeAction(this.code);
}

class ChangeScreenStateAction {
  final ScreenState type;

  ChangeScreenStateAction(this.type);
}

class ChangeLoadingStatusAction {
  final LoadingStatus status;

  ChangeLoadingStatusAction(this.status);
}

class EmailErrorAction {
  final String message;
  final ScreenState screenState;

  EmailErrorAction(this.message, this.screenState);
}

class PasswordErrorAction {
  final String message;
  final ScreenState screenState;

  PasswordErrorAction(this.message, this.screenState);
}

class RetypePasswordErrorAction {
  final String message;
  final ScreenState screenState;

  RetypePasswordErrorAction(this.message, this.screenState);
}

class CodeErrorAction {
  final String message;

  CodeErrorAction(this.message);
}

class SignInAction {
  final AuthRequest request;

  SignInAction(this.request);
}

class SignUpAction {
  final SignUpRequest request;

  SignUpAction(this.request);
}

class SaveTokenAction {
  final String token;

  SaveTokenAction(this.token);
}

class RequestCodeAction {
  final String email;

  RequestCodeAction(this.email);
}

class ConfirmForgotPasswordAction {
  final String code;
  final String password;

  ConfirmForgotPasswordAction(this.code, this.password);
}

class CheckTokenAction {
  final VoidCallback hasTokenCallback;
  final VoidCallback noTokenCallback;

  CheckTokenAction({this.hasTokenCallback, this.noTokenCallback});
}

class ClearErrorsAction {}
