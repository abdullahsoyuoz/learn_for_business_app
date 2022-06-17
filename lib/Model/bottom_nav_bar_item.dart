import 'package:flutter/material.dart';
import 'package:learn_for_business_app/Controller/asset_constants.dart';

class NavBarItem {
  late int id;
  late String title;
  late String icon;
  NavBarItem({
    required this.id,
    required this.title,
    required this.icon,
  });
}

List<NavBarItem> navbarList = [
  NavBarItem(id: 0, title: 'Anasayfa', icon: AppConstants.home),
  NavBarItem(id: 1, title: 'Eğitimlerim', icon: AppConstants.course),
  NavBarItem(id: 2, title: 'Fiyatlar', icon: AppConstants.tag),
  NavBarItem(id: 3, title: 'Profilim', icon: AppConstants.profile),
];

Future<void> navbarRouteHelper(BuildContext context, int id) async {
  switch (id) {
    case 0:
      break;
    default:
  }
}