import 'package:flutter/material.dart';

import 'package:rate_my_bistro/model/Menu.dart';
import 'package:rate_my_bistro/theme/ThemeData.dart';

class MenuDetail extends StatelessWidget {
  final Menu menu;

  const MenuDetail({ @required this.menu });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.asset(
                      menu.assetName,
                      package: menu.assetPackage,
                      fit: BoxFit.fitWidth
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10.0,),
                      Text(menu.name, style: bistroTheme.textTheme.title,),
                      SizedBox(height: 10.0,),
                      Text("mit Pommes und Kirschtomaten"),
                      SizedBox(height: 10.0,),
                      Divider(height: 1.0, thickness: 1.0,),
                      SizedBox(height: 10.0,),
                      Text("Rating"),
                      SizedBox(height: 10.0,),
                      Divider(height: 1.0, thickness: 1.0,),
                      SizedBox(height: 10.0,),
                    ],
                  )
                )

              ]
            ),
        ),
      ],
    );
  }
}