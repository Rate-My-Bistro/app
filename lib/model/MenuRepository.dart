// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'Menu.dart';

class MenusRepository {
  static List<Menu> loadMenus(Category category) {
    const allMenus = <Menu> [
      Menu(
        category: Category.Home,
        id: 0,
        isFeatured: true,
        name: 'Sugar and beetroot cake',
        price: 5.45,
      ),
      Menu(
        category: Category.Home,
        id: 1,
        isFeatured: true,
        name: 'Rocket and squash penne',
        price: 5.89,
      ),
      Menu(
        category: Category.Home,
        id: 2,
        isFeatured: false,
        name: 'Fennel and chard stir fry',
        price: 3.30,
      ),
      Menu(
        category: Category.Home,
        id: 3,
        isFeatured: true,
        name: 'Quorn and parsley salad',
        price: 9.8,
      ),
      Menu(
        category: Category.Home,
        id: 4,
        isFeatured: false,
        name: 'Rabbit and venison stew',
        price: 3.4,
      ),
      Menu(
        category: Category.Home,
        id: 5,
        isFeatured: false,
        name: 'Fish and squash casserole',
        price: 1.2,
      ),
      Menu(
        category: Category.Home,
        id: 6,
        isFeatured: false,
        name: 'Coconut and raspberry cake',
        price: 1.6,
      ),
      Menu(
        category: Category.Home,
        id: 7,
        isFeatured: true,
        name: 'Stilton and fregola spaghetti',
        price: 4.0,
      ),
      Menu(
        category: Category.Home,
        id: 8,
        isFeatured: true,
        name: 'Gherkin and butterbean salad',
        price: 1.98,
      ),
      Menu(
        category: Category.Home,
        id: 9,
        isFeatured: true,
        name: 'Chocolate and stilton buns',
        price: 5.8,
      ),
      Menu(
        category: Category.Home,
        id: 10,
        isFeatured: false,
        name: 'Duck and lamb madras',
        price: 1.8,
      ),
      Menu(
        category: Category.Home,
        id: 11,
        isFeatured: false,
        name: 'Jalape and donair salad',
        price: 2.8,
      ),
      Menu(
        category: Category.Home,
        id: 12,
        isFeatured: false,
        name: 'Bilberry and blackberry jam',
        price: 3.4,
      ),
      Menu(
        category: Category.Home,
        id: 13,
        isFeatured: true,
        name: 'Turbot and cucumber salad',
        price: 1.8,
      ),
      Menu(
        category: Category.Home,
        id: 14,
        isFeatured: true,
        name: 'Garlic oil and goji berry salad',
        price: 2.7,
      ),
      Menu(
        category: Category.Home,
        id: 15,
        isFeatured: true,
        name: 'Lime and pineapple kebab',
        price: 1.6,
      ),
      Menu(
        category: Category.Home,
        id: 16,
        isFeatured: true,
        name: 'Ebly and egusi salad',
        price: 1.6,
      ),
      Menu(
        category: Category.Home,
        id: 17,
        isFeatured: false,
        name: 'Pepper and tofu burgers',
        price: 1.75,
      ),
      Menu(
        category: Category.Home,
        id: 18,
        isFeatured: true,
        name: 'Onion tart with garlic sauce',
        price: 1.29,
      ),
      Menu(
        category: Category.Profile,
        id: 19,
        isFeatured: false,
        name: 'Apple and polenta buns',
        price: 4.8,
      ),
      Menu(
        category: Category.Profile,
        id: 20,
        isFeatured: false,
        name: 'Squash and polenta cake',
        price: 4.5,
      ),
      Menu(
        category: Category.Profile,
        id: 21,
        isFeatured: false,
        name: 'Buffalo and kaffir lime leaf salad',
        price: 3.8,
      ),
      Menu(
        category: Category.Profile,
        id: 22,
        isFeatured: false,
        name: 'Peanut and pumpkin korma',
        price: 7.0,
      ),
      Menu(
        category: Category.Profile,
        id: 23,
        isFeatured: false,
        name: 'Hp sauce and kipper salad',
        price: 7.0,
      ),
      Menu(
        category: Category.Profile,
        id: 24,
        isFeatured: true,
        name: 'Duck and mandarin salad',
        price: 6.0,
      ),
      Menu(
        category: Category.Profile,
        id: 25,
        isFeatured: false,
        name: 'Sausage and tofu gyoza',
        price: 1.78,
      ),
      Menu(
        category: Category.Profile,
        id: 26,
        isFeatured: false,
        name: 'Mascarpone and wheat salad',
        price: 7.4,
      ),
      Menu(
        category: Category.Settings,
        id: 27,
        isFeatured: true,
        name: 'Bean and tempeh casserole',
        price: 3.8,
      ),
      Menu(
        category: Category.Settings,
        id: 28,
        isFeatured: true,
        name: 'Egusi and saffron soup',
        price: 4.8,
      ),
      Menu(
        category: Category.Settings,
        id: 29,
        isFeatured: true,
        name: 'Peanut and beef curry',
        price: 9.8,
      ),
      Menu(
        category: Category.Settings,
        id: 30,
        isFeatured: true,
        name: 'Miso and kale soup',
        price: 6.8,
      ),
      Menu(
        category: Category.Settings,
        id: 31,
        isFeatured: false,
        name: 'Jalapeno and egg ciabatta',
        price: 3.8,
      ),
      Menu(
        category: Category.Settings,
        id: 32,
        isFeatured: false,
        name: 'Aubergine and pepper maki',
        price: 5.8,
      ),
      Menu(
        category: Category.Settings,
        id: 33,
        isFeatured: true,
        name: 'Cod and cheese dumplings',
        price: 4.2,
      ),
      Menu(
        category: Category.Logout,
        id: 34,
        isFeatured: false,
        name: 'Sweetcorn and hazelnut pancake',
        price: 2.7,
      ),
      Menu(
        category: Category.Logout,
        id: 35,
        isFeatured: false,
        name: 'Spinach and pesto lasagne',
        price: 2.4,
      ),
      Menu(
        category: Category.Logout,
        id: 36,
        isFeatured: false,
        name: 'Cinnamon and peach buns',
        price: 5.8,
      ),
      Menu(
        category: Category.Logout,
        id: 37,
        isFeatured: true,
        name: 'Peppercorn and cheese penne',
        price: 5.8,
      ),
    ];
    if (category == Category.Home) {
      return allMenus;
    } else {
      return allMenus.where((Menu p) {
        return p.category == category;
      }).toList();
    }
  }
}
