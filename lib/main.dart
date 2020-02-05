import 'package:flutter/material.dart';
import 'package:rate_my_bistro/app.dart';
import 'package:rate_my_bistro/store.dart';

void main() async {
  var store = await createStore();

  runApp(
      new BistroApp(
        store,
        'Rate my Bistro',
      )
  );
}
