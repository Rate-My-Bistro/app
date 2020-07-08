import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rate_my_bistro/model/Menu.dart';
import 'package:rate_my_bistro/theme/ThemeData.dart';

/// Widget that provides a quick navigation
/// through all available app pages
///
/// TODO Rename this to sth like AppMenu
///
/// @author Ansgar Sachs <ansgar.sachs@cgm.com>
///
class CategoryMenu extends StatelessWidget {
  final Category currentCategory;
  final List<Category> _categories = Category.values;

  const CategoryMenu({
    Key key,
    @required this.currentCategory,
  }) : assert(currentCategory != null);

  Widget _buildCategory(Category category, BuildContext context) {
    final categoryString =
        category.toString().replaceAll('Category.', '').toUpperCase();

    return GestureDetector(
      onTap: () {},
      child: category == currentCategory
          ? Column(
              children: <Widget>[
                SizedBox(height: 16.0),
                Text(
                  categoryString,
                  style: BistroDesign.theme.textTheme.body2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 14.0),
                Container(
                  width: 70.0,
                  height: 2.0,
                  color: BistroDesign.colors.kBistroPink400,
                ),
              ],
            )
          : Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                categoryString,
                style: BistroDesign.theme.textTheme.body2.copyWith(
                    color: BistroDesign.colors.kBistroBrown900.withAlpha(153)),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 50.0),
        color: BistroDesign.theme.primaryColor,
        child: ListView(
            children: _categories
                .map((Category c) => _buildCategory(c, context))
                .toList()),
      ),
    );
  }
}
