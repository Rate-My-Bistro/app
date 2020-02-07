import 'package:flutter/cupertino.dart';
import 'package:rate_my_bistro/components/CategoryMenu.dart';
import 'package:rate_my_bistro/components/MenuDetail.dart';
import 'package:rate_my_bistro/components/backdrop/Backdrop.dart';
import 'package:rate_my_bistro/model/Menu.dart';
import 'package:rate_my_bistro/theme/ThemeData.dart';

/// Page that shows detailed information about a specific meal
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///
class MenuDetailPage extends StatelessWidget {
  final Category currentCategory;
  final Menu menu;

  const MenuDetailPage({
    @required this.currentCategory,
    @required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return Backdrop(
      currentCategory: currentCategory,
      frontLayer: MenuDetail(menu: menu),
      backLayer: CategoryMenu(
        currentCategory: currentCategory,
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
