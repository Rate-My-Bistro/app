import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rate_my_bistro/components/MenuDateBar.dart';
import 'package:rate_my_bistro/model/Menu.dart';
import 'package:rate_my_bistro/model/MenuRepository.dart';
import 'package:rate_my_bistro/pages/MenuDetailPage.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rate_my_bistro/theme/ThemeData.dart';

/// Widget that lists all meals
/// of a specific time range
///
/// Allows the user to vote or
/// select each meal
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///
class MenuList extends StatelessWidget {
  final Category category;
  final Function onMenuTap;

  const MenuList({
    this.category: Category.Home,
    this.onMenuTap
  });

  List<GestureDetector> _buildMenuList(BuildContext context) {
    List<Menu> products = MenusRepository.loadMenus(category);

    if (products == null || products.isEmpty) {
      return const <GestureDetector>[];
    }

    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MenuDetailPage(
                      currentCategory: category,
                      menu: product,
                  )),
            );
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 15 / 11,
                  child: Image.asset(
                      product.assetPackage + "/" + product.assetName,
                      fit: BoxFit.cover),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(product.name,
                                      style: BistroDesign.theme.textTheme.title,
                                      overflow: TextOverflow.ellipsis),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "mit Pommes und Kirschtomaten",
                                    style:
                                        BistroDesign.theme.textTheme.subtitle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    product.price.toStringAsFixed(2) + "€",
                                    style: BistroDesign.theme.textTheme.title,
                                  )
                                ],
                              )
                            ]),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
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
                      ],
                    ),
                  ),
                )
              ],
            ),
          ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.0, left: 5.0, bottom: 3, right: 5),
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[MenuDateBar()]),
          Expanded(
            child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 0.95,
                children: _buildMenuList(context)),
          )
        ],
      ),
    );
  }
}
