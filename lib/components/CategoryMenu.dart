import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../theme/Colors.dart';
import '../model/Menu.dart';

class CategoryMenu extends StatelessWidget {
  final Category currentCategory;
  final ValueChanged<Category> onCategoryTap;
  final List<Category> _categories = Category.values;

  const CategoryMenu({
    Key key,
    @required this.currentCategory,
    @required this.onCategoryTap,
  }) : assert(currentCategory != null),
       assert(onCategoryTap != null);

  Widget _buildCategory(Category category, BuildContext context) {
    final categoryString = category.toString().replaceAll('Category.', '').toUpperCase();
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onCategoryTap(category),
      child: category == currentCategory
          ? Column(
        children: <Widget>[
          SizedBox(height: 16.0),
          Text(
            categoryString,
            style: theme.textTheme.body2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14.0),
          Container(
            width: 70.0,
            height: 2.0,
            color: kBistroPink400,
          ),
        ],
      )
          : Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          categoryString,
          style: theme.textTheme.body2.copyWith(
              color: kBistroBrown900.withAlpha(153)
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 40.0),
        color: kBistroPink100,
        child: ListView(
            children: _categories
                .map((Category c) => _buildCategory(c, context))
                .toList()),
      ),
    );
  }
}