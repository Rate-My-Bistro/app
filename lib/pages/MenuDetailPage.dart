import 'package:flutter/cupertino.dart';

import 'package:rate_my_bistro/theme/ThemeData.dart';

import 'package:rate_my_bistro/components/Backdrop.dart';
import 'package:rate_my_bistro/components/CategoryMenu.dart';
import 'package:rate_my_bistro/components/MenuDetail.dart';

import 'package:rate_my_bistro/model/Menu.dart';

class MenuDetailPage extends StatelessWidget {
  final Category currentCategory;
  final Menu menu;
  final Function onCategoryTap;

  const MenuDetailPage({
    @required this.currentCategory,
    @required this.onCategoryTap,
    @required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return Backdrop(
      currentCategory: currentCategory,
      frontLayer: MenuDetail(menu: menu),
      backLayer: CategoryMenu(
        currentCategory: currentCategory,
        onCategoryTap: onCategoryTap,
      ),
      frontTitle: Text('Rate my Bistro', style: bistroTheme.appBarTheme.textTheme.title,),
      backTitle: Text('Menu', style: bistroTheme.appBarTheme.textTheme.title,),
    );
  }
}