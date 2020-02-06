import 'package:flutter/cupertino.dart';

import '../theme/ThemeData.dart';
import '../components/backdrop/Backdrop.dart';
import '../components/CategoryMenu.dart';
import '../components/MenuList.dart';
import '../model/Menu.dart';

/// Page that lists all meals for a given date
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///
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
          onCategoryTap: onCategoryTap),
      backLayer: CategoryMenu(
        currentCategory: currentCategory,
        onCategoryTap: onCategoryTap,
      ),
      frontTitle: Text(
        'Rate my Bistro',
        style: BistroDesign.theme.appBarTheme.textTheme.title,
      ),
      backTitle: Text(
        'Menu',
        style: BistroDesign.theme.appBarTheme.textTheme.title,
      ),
    );
  }
}
