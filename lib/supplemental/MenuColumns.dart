import 'package:flutter/material.dart';

import '../model/Menu.dart';
import 'ProductCard.dart';

class TwoProductCardColumn extends StatelessWidget {
  TwoProductCardColumn({
    this.bottom,
    this.top,
  }) : assert(bottom != null);

  final Menu bottom, top;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      const spacerHeight = 44.0;

      double heightOfCards = (constraints.biggest.height - spacerHeight) / 2.0;
      double heightOfImages = heightOfCards - ProductCard.kTextBoxHeight;
      double imageAspectRatio = heightOfImages >= 0.0
          ? constraints.biggest.width / heightOfImages
          : 49.0 / 33.0;

      return ListView(
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.only(start: 28.0),
            child: top != null
                ? ProductCard(
              imageAspectRatio: imageAspectRatio,
              product: top,
            )
                : SizedBox(
              height: heightOfCards,
            ),
          ),
          SizedBox(height: spacerHeight),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 28.0),
            child: ProductCard(
              imageAspectRatio: imageAspectRatio,
              product: bottom,
            ),
          ),
        ],
      );
    });
  }
}

class OneProductCardColumn extends StatelessWidget {
  OneProductCardColumn({this.product});

  final Menu product;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      reverse: true,
      children: <Widget>[
        SizedBox(
          height: 40.0,
        ),
        ProductCard(
          product: product,
        ),
      ],
    );
  }
}
