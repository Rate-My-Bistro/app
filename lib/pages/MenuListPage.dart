import 'package:flutter/cupertino.dart';

import 'package:rate_my_bistro/theme/ThemeData.dart';

import 'package:rate_my_bistro/components/Backdrop.dart';
import 'package:rate_my_bistro/components/CategoryMenu.dart';
import 'package:rate_my_bistro/components/MenuList.dart';

import 'package:rate_my_bistro/model/Menu.dart';

class MenuListPage extends StatelessWidget {
  final Category currentCategory;
  final Function onMenuTap;
  final Function onCategoryTap;

  const MenuListPage({
    @required this.currentCategory,
    @required this.onMenuTap,
    @required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Backdrop(
      currentCategory: currentCategory,
      frontLayer: MenuList(
          category: currentCategory,
          onMenuTap: onMenuTap,
          onCategoryTap: onCategoryTap
      ),
      backLayer: CategoryMenu(
        currentCategory: currentCategory,
        onCategoryTap: onCategoryTap,
      ),
      frontTitle: Text('Rate my Bistro', style: bistroTheme.appBarTheme.textTheme.title,),
      backTitle: Text('Menu', style: bistroTheme.appBarTheme.textTheme.title,),
    );
  }

}