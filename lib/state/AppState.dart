import 'package:flutter/material.dart';
import 'package:rate_my_bistro/model/Menu.dart';
import 'package:rate_my_bistro/state/AuthState.dart';
import 'package:rate_my_bistro/state/MenuState.dart';
import 'package:rate_my_bistro/state/SignInState.dart';

/// Root State of the application
///
/// Composes all substates together
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///
@immutable
class AppState {
  final SignInState signInState;
  final AuthState authState;
  final MenuState menuState;
  final Category category;

  AppState({
    @required this.signInState,
    @required this.authState,
    @required this.menuState,
    this.category
  });

  factory AppState.initial() {
    return AppState(
        authState: AuthState.initial(),
        signInState: SignInState.initial(),
        menuState: MenuState.initial(),
        category: null);
  }

  AppState copyWith({
    AuthState authState,
    SignInState signInState,
    MenuState menuState,
    Category category,
  }) {
    return AppState(
        authState: authState ?? this.authState,
        signInState: signInState ?? this.signInState,
        menuState: menuState ?? this.menuState,
        category: category ?? this.category
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          authState == other.authState &&
          signInState == other.signInState &&
          menuState == other.menuState &&
          category == other.category;

  @override
  int get hashCode =>
      authState.hashCode ^
      signInState.hashCode ^
      category.hashCode ^
      menuState.hashCode;
}
