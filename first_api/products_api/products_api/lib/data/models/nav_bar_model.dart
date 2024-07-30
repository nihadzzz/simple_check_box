import 'package:flutter/material.dart';

class NavBarModel {
  final IconData icon;
  final String iconTitle;

  NavBarModel({
    required this.icon,
    required this.iconTitle,
  });

  static List navBarDatas = [
    NavBarModel(
      icon: Icons.my_library_add_outlined,
      iconTitle: 'Main',
    ),
    NavBarModel(
      icon: Icons.production_quantity_limits_rounded,
      iconTitle: 'Products',
    ),
    NavBarModel(
      icon: Icons.wine_bar,
      iconTitle: 'Cellar',
    ),
    NavBarModel(
      icon: Icons.more_horiz,
      iconTitle: 'More',
    ),
  ];
}
