import 'package:flutter/cupertino.dart';

import '../theme/ThemeData.dart';
import '../components/backdrop/Backdrop.dart';
import '../components/CategoryMenu.dart';
import '../components/MenuDetail.dart';
import '../model/Menu.dart';

/// Page that shows detailed information about a specific meal
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///
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
