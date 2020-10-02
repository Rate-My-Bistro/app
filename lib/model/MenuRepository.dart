import 'package:rate_my_bistro/model/Menu.dart';
import 'package:rate_my_bistro/utils/DateUtils.dart';

/// TODO: Move this code into State and ViewModels
///
/// author Ansgar Sachs <ansgar.sachs@cgm.com>

class MenusRepository {
  static List<Menu> createFakeMenuData() {
    return <Menu>[
      Menu(
        category: Category.Home,
        id: 0,
        isFeatured: true,
        name: 'Sugar and beetroot cake',
        date: DateUtils.getYesterday(),
        price: 5.45,
      ),
      Menu(
        category: Category.Home,
        id: 1,
        isFeatured: true,
        name: 'Rocket and squash penne',
        date: DateUtils.getYesterday(),
        price: 5.89,
      ),
      Menu(
        category: Category.Home,
        id: 2,
        isFeatured: false,
        name: 'Fennel and chard stir fry',
        date: DateUtils.getYesterday(),
        price: 3.30,
      ),
      Menu(
        category: Category.Home,
        id: 3,
        isFeatured: true,
        name: 'Quorn and parsley salad',
        date: DateUtils.getYesterday(),
        price: 9.8,
      ),
      Menu(
        category: Category.Home,
        id: 4,
        isFeatured: false,
        name: 'Rabbit and venison stew',
        date: DateUtils.getToday(),
        price: 3.4,
      ),
      Menu(
        category: Category.Home,
        id: 5,
        isFeatured: false,
        name: 'Fish and squash casserole',
        date: DateUtils.getToday(),
        price: 1.2,
      ),
      Menu(
        category: Category.Home,
        id: 6,
        isFeatured: false,
        name: 'Coconut and raspberry cake',
        date: DateUtils.getToday(),
        price: 1.6,
      ),
      Menu(
        category: Category.Home,
        id: 7,
        isFeatured: true,
        name: 'Stilton and fregola spaghetti',
        date: DateUtils.getToday(),
        price: 4.0,
      ),
      Menu(
        category: Category.Home,
        id: 8,
        isFeatured: true,
        name: 'Gherkin and butterbean salad',
        date: DateUtils.getTomorrow(),
        price: 1.98,
      ),
      Menu(
        category: Category.Home,
        id: 9,
        isFeatured: true,
        name: 'Chocolate and stilton buns',
        date: DateUtils.getTomorrow(),
        price: 5.8,
      ),
      Menu(
        category: Category.Home,
        id: 10,
        isFeatured: false,
        name: 'Duck and lamb madras',
        date: DateUtils.getTomorrow(),
        price: 1.8,
      ),
      Menu(
        category: Category.Home,
        id: 11,
        isFeatured: false,
        name: 'Jalape and donair salad',
        date: DateUtils.getTomorrow(),
        price: 2.8,
      ),
      Menu(
        category: Category.Home,
        id: 12,
        isFeatured: false,
        name: 'Bilberry and blackberry jam',
        date: DateUtils.getDaysInFuture(2),
        price: 3.4,
      ),
      Menu(
        category: Category.Home,
        id: 13,
        isFeatured: true,
        name: 'Turbot and cucumber salad',
        date: DateUtils.getDaysInFuture(2),
        price: 1.8,
      ),
      Menu(
        category: Category.Home,
        id: 14,
        isFeatured: true,
        name: 'Garlic oil and goji berry salad',
        date: DateUtils.getDaysInFuture(2),
        price: 2.7,
      ),
      Menu(
        category: Category.Home,
        id: 15,
        isFeatured: true,
        name: 'Lime and pineapple kebab',
        date: DateUtils.getDaysInFuture(2),
        price: 1.6,
      ),
    ];
  }

  static List<Menu> filterByCategory(List<Menu> menus, Category category) {
    return category == Category.Home ? menus : menus.where((Menu p) {
      return p.category == category;
    }).toList();
  }

  static List<Menu> filterByDate(List<Menu> menus, DateTime date) {
    return menus.where((Menu m) => DateUtils.isSameDay(m.date, date)).toList();
  }

  static List<Menu> loadMenus(Category category, DateTime selectedMenuDay) {
    List<Menu> allMenus = createFakeMenuData();
    List<Menu> menusByCategory = filterByCategory(allMenus, category);
    return filterByDate(menusByCategory, selectedMenuDay);
  }
}
