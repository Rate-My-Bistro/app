import 'package:rate_my_bistro/actions/NavigationActions.dart';
import 'package:rate_my_bistro/model/Menu.dart';
import 'package:rate_my_bistro/state/AppState.dart';
import 'package:rate_my_bistro/state/LoadingStatus.dart';
import 'package:rate_my_bistro/state/ScreenState.dart';
import 'package:redux/redux.dart';

class MenuListViewModel {
    final LoadingStatus status;
    final ScreenState type;
    final List<Menu> menus;

    Function(int) navigateToDetail;
    Function(double) rateMenu;

    MenuListViewModel({
        this.status,
        this.type,
        this.menus,
        this.navigateToDetail
    });

    static MenuListViewModel fromStore(Store<AppState> store) {
        return new MenuListViewModel(
            status: store.state.menuState.loadingStatus,
            type: store.state.menuState.type,
            menus: store.state.menuState.menus,
            navigateToDetail: (menuId) => store.dispatch(new NavigateToDetailAction(menuId))
        );
    }
}
