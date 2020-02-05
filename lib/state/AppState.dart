import 'package:flutter/material.dart';
import 'package:rate_my_bistro/model/Menu.dart';
import 'package:rate_my_bistro/state/AuthState.dart';
import 'package:rate_my_bistro/state/SignInState.dart';

@immutable
class AppState {
  final SignInState signInState;
  final AuthState authState;
  final List<Menu> menus;
  final Category category;

  AppState({
    @required this.signInState,
    @required this.authState,
    this.menus,
    this.category
  });

  factory AppState.initial(){
    return AppState(
        authState: AuthState.initial(),
        signInState: SignInState.initial(),
        menus: List.unmodifiable([]) ,
        category: null
    );
  }

  AppState copyWith({
    AuthState authState,
    SignInState signInState,
    List<Menu> menus,
    Category category,
  }){
    return AppState(
        authState: authState ?? this.authState,
        signInState: signInState ?? this.signInState,
        menus: menus ?? this.menus,
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
              menus == other.menus &&
              category == other.category;

  @override
  int get hashCode =>
      authState.hashCode ^
      signInState.hashCode ^
      category.hashCode ^
      menus.hashCode;
}

enum ListState {
  listOnly, listWithNewItem
}