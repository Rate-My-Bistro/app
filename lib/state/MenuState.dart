import 'package:meta/meta.dart';
import 'package:rate_my_bistro/model/Menu.dart';
import 'package:rate_my_bistro/model/MenuRepository.dart';
import 'package:rate_my_bistro/state/LoadingStatus.dart';
import 'package:rate_my_bistro/state/ScreenState.dart';

@immutable
class MenuState {
  final LoadingStatus loadingStatus;
  final ScreenState type;
  final List<Menu> menus;
  final int selected;

  MenuState({
    this.loadingStatus,
    this.type,
    this.menus,
    this.selected,
  });

  MenuState copyWith({
    LoadingStatus loadingStatus,
    ScreenState type,
    List<Menu> menus,
    int selected,
  }) {
    return new MenuState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        type: type ?? this.type,
        menus: menus ?? this.menus,
        selected: selected ?? this.selected);
  }

  factory MenuState.initial() {
    return new MenuState(
        type: ScreenState.WELCOME,
        loadingStatus: LoadingStatus.SUCCESS,
        selected: null,
        menus: MenusRepository.loadMenus(Category.Home));
  }
}
