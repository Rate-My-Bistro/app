import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rate_my_bistro/components/CategoryMenu.dart';
import 'package:rate_my_bistro/components/MenuList.dart';
import 'package:rate_my_bistro/components/backdrop/Backdrop.dart';
import 'package:rate_my_bistro/model/Menu.dart';
import 'package:rate_my_bistro/pages/menuList/MenuListViewModel.dart';
import 'package:rate_my_bistro/state/AppState.dart';
import 'package:rate_my_bistro/theme/ThemeData.dart';

/// Page that lists all meals for a given date
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///
class MenuListPage extends StatelessWidget {
  final Category currentCategory;
  final Function onMenuTap;

  const MenuListPage({
    @required this.currentCategory,
    @required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, MenuListViewModel>(
        onInit: (store) {},
        converter: (store) => MenuListViewModel.fromStore(store),
        builder: (_, viewModel) => buildContent(viewModel)
    );
  }

  Widget buildContent(MenuListViewModel viewModel) {
    return Backdrop(
      currentCategory: currentCategory,
      frontLayer: MenuList(
        category: currentCategory,
        onMenuTap: onMenuTap,
        selectedMenuDay: viewModel.selectedMenuDay,
        onMenuDaySelect: viewModel.selectMenuDay,
      ),
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
