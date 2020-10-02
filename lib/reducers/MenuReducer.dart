import 'package:rate_my_bistro/actions/MenuActions.dart';
import 'package:rate_my_bistro/state/MenuState.dart';
import 'package:redux/redux.dart';

final menuReducer = combineReducers<MenuState>([
  TypedReducer<MenuState, SelectMenuDayAction>(_selectMenuDayAction)
]);

MenuState _selectMenuDayAction(MenuState state, SelectMenuDayAction action) => state.copyWith(selectedMenuDay: action.selectedMenuDay);
