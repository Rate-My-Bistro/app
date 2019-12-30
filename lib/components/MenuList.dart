import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rate_my_bistro/pages/MenuDetailPage.dart';
import 'package:rate_my_bistro/theme/ThemeData.dart';

import '../model/MenuRepository.dart';
import '../model/Menu.dart';

class MenuList extends StatelessWidget {
  final Category category;
  final Function onMenuTap;
  final Function onCategoryTap;

  const MenuList({this.category: Category.all, this.onMenuTap, this.onCategoryTap });

  List<GestureDetector> _buildMenuList(BuildContext context) {
    List<Menu> products = MenusRepository.loadMenus(category);

    if (products == null || products.isEmpty) {
      return const <GestureDetector>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString()
    );

    return products.map((product) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) =>
                MenuDetailPage(currentCategory: category, menu: product, onCategoryTap: onCategoryTap)),
          );
        },
        child: Card(
          shape:  BeveledRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(46.0)),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 15 / 11,
                child: Image.asset(
                    product.assetName,
                    package: product.assetPackage,
                    fit: BoxFit.fitWidth
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        product == null ? '' : product.name,
                        style: theme.textTheme.button,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        product == null ? '' : formatter.format(product.price),
                        style: theme.textTheme.caption,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.0, left: 16, bottom: 16, right: 16),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0,),
          Expanded(
            child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 0.95,
                children: _buildMenuList(context)
            ),
          )
        ],
      ),
    );
  }
}
