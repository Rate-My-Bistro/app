import 'package:flutter/material.dart';
import 'package:rate_my_bistro/app.dart';
import 'package:rate_my_bistro/store.dart';

/// Injects the application's store
/// into the Bistro Application and
/// executes the app
///
/// Represents the acutal entrypoint
/// for the whole application
void main() async {
  final store = await createStore();
  final appTitle = 'Rate my Bistro';

  runApp(new BistroApp(store, appTitle));
}
