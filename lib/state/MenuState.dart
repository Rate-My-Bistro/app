import 'package:meta/meta.dart';
import 'package:rate_my_bistro/model/Menu.dart';
import 'package:rate_my_bistro/model/MenuRepository.dart';
import 'package:rate_my_bistro/state/LoadingStatus.dart';
import 'package:rate_my_bistro/state/ScreenState.dart';

@immutable
class MenuState {
  final ScreenState type;
  final LoadingStatus loadingStatus;
  final List<Menu> menus;
  final DateTime selectedMenuDay;
  final int selectedMenu;

  MenuState({
    @required this.loadingStatus,
    @required this.type,
    @required this.menus,
    @required this.selectedMenuDay,
    this.selectedMenu,
  });

  factory MenuState.initial() {
    return new MenuState(
        type: ScreenState.WELCOME,
        loadingStatus: LoadingStatus.SUCCESS,
        menus: MenusRepository.loadMenus(Category.Home, DateTime.now()),
        selectedMenuDay: DateTime.now(),
        selectedMenu: null,
    );
  }

  MenuState copyWith({
    LoadingStatus loadingStatus,
    ScreenState type,
    List<Menu> menus,
    DateTime selectedMenuDay,
    int selected,
  }) {
    return new MenuState(
        type: type ?? this.type,
        loadingStatus: loadingStatus ?? this.loadingStatus,
        menus: menus ?? this.menus,
        selectedMenuDay: selectedMenuDay ?? this.selectedMenuDay,
        selectedMenu: selected ?? this.selectedMenu,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) &&
      other is MenuState &&
      runtimeType == other.runtimeType &&
      loadingStatus == other.loadingStatus &&
      menus == other.menus &&
      selectedMenuDay == other.selectedMenuDay &&
      selectedMenu == other.selectedMenu;

  @override
  int get hashCode =>
      loadingStatus.hashCode ^
      type.hashCode ^
      menus.hashCode ^
      selectedMenuDay.hashCode ^
      selectedMenu.hashCode;
}
