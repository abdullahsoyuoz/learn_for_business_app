import 'package:flutter/material.dart';
import 'package:learn_for_business_app/Controller/asset_constants.dart';

class NavBarItem {
  int index;
  String title;
  String icon;
  NavBarItem({
    this.index,
    this.title,
    this.icon,
  });
}

List<NavBarItem> navbarList = [
  NavBarItem(index: 0, title: 'Anasayfa', icon: AppConstants.home),
  NavBarItem(index: 1, title: 'Kurslar', icon: AppConstants.course),
  NavBarItem(index: 2, title: 'Fiyatlar', icon: AppConstants.tag),
  NavBarItem(index: 3, title: 'Profilim', icon: AppConstants.profile),
];

Future<void> navbarRouteHelper(BuildContext context, int id) async {
  switch (id) {
    case 0:
      break;
    default:
  }
}
