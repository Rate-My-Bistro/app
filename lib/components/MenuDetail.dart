import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:bubble/bubble.dart';

import 'package:rate_my_bistro/model/Menu.dart';
import 'package:rate_my_bistro/theme/Colors.dart';
import 'package:rate_my_bistro/theme/ThemeData.dart';

class MenuDetail extends StatelessWidget {
  final Menu menu;

  const MenuDetail({ @required this.menu });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 2,
            child: Image.asset(
                menu.assetPackage + "/" + menu.assetName,
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
                Center(
                    child: RatingBar(
                      initialRating: 3,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                ),
                SizedBox(height: 10.0,),
                Divider(height: 1.0, thickness: 1.0,),
                SizedBox(height: 10.0,),
                Center(
                  child: Text(menu.price.toStringAsFixed(2) + "€", style: bistroTheme.textTheme.title,),
                ),
                SizedBox(height: 10.0,),
                Divider(height: 1.0, thickness: 1.0,),
                SizedBox(height: 10.0,),
                Text("Comments", style: bistroTheme.textTheme.title,),
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
              children: <Widget>[
                Bubble(
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, 212, 234, 244),
                  elevation: 1.5,
                  margin: BubbleEdges.only(top: 8.0, left: 0.0, right: 0.0),
                  child: Text('Today', style: bistroTheme.textTheme.body1),
                ),
                Bubble(
                  alignment: Alignment.topLeft,
                  nip: BubbleNip.leftTop,
                  color: Color.fromRGBO(225, 255, 199, 1.0),
                  elevation: 1.5,
                  margin: BubbleEdges.only(top: 8.0, left: 0.0, right: 0.0),
                  child: Text('Liked that cheesy taste', style: bistroTheme.textTheme.body1),
                ),
                Bubble(
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, 212, 234, 244),
                  elevation: 1.5,
                  margin: BubbleEdges.only(top: 8.0, left: 0.0, right: 0.0),
                  child: Text('Yesterday', style: bistroTheme.textTheme.body1),
                ),
                Bubble(
                  alignment: Alignment.topLeft,
                  nip: BubbleNip.leftTop,
                  color: Color.fromRGBO(225, 255, 199, 1.0),
                  elevation: 1.5,
                  margin: BubbleEdges.only(top: 8.0, left: 0.0, right: 0.0),
                  child: Text('Liked that crunchy taste', style: bistroTheme.textTheme.body1),
                ),
                Bubble(
                  alignment: Alignment.topLeft,
                  nip: BubbleNip.leftTop,
                  color: Color.fromRGBO(225, 255, 199, 1.0),
                  elevation: 1.5,
                  margin: BubbleEdges.only(top: 8.0, left: 0.0, right: 0.0),
                  child: Text('Liked that crunchy taste', style: bistroTheme.textTheme.body1),
                ),
                Bubble(
                  alignment: Alignment.topLeft,
                  nip: BubbleNip.leftTop,
                  color: Color.fromRGBO(225, 255, 199, 1.0),
                  elevation: 1.5,
                  margin: BubbleEdges.only(top: 8.0, left: 0.0, right: 0.0),
                  child: Text('Liked that crunchy taste', style: bistroTheme.textTheme.body1),
                ),
                Bubble(
                  alignment: Alignment.topLeft,
                  nip: BubbleNip.leftTop,
                  color: Color.fromRGBO(225, 255, 199, 1.0),
                  elevation: 1.5,
                  margin: BubbleEdges.only(top: 8.0, left: 0.0, right: 0.0),
                  child: Text('Liked that crunchy taste', style: bistroTheme.textTheme.body1),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10.0,
        color: bistroTheme.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.message, color: Colors.white),
                  onPressed: () {},
                ),
                Text("Comment", style: bistroTheme.textTheme.body1.apply(color: Colors.white),),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Take photo", style: bistroTheme.textTheme.body1.apply(color: Colors.white),),
                IconButton(
                    icon: Icon(Icons.image, color: Colors.white),
                    onPressed: () {}
                )
              ],
            )
          ],
        ),
      )
    );
  }
}