import 'package:flutter/cupertino.dart';
import 'package:learn_for_business_app/Controller/asset_constants.dart';
import 'package:learn_for_business_app/View/Page/Contact/contact_page.dart';
import 'package:learn_for_business_app/View/Page/PrivacyNTerms/privacy_policy_terms_page.dart';
import 'package:learn_for_business_app/View/Page/Profile/password_renew_page.dart';

class ProfileMenuItem {
  int id;
  String title;
  String icon;
  ProfileMenuItem({this.icon, this.id, this.title});
}

List<ProfileMenuItem> profileMenuItems = [
  ProfileMenuItem(id: 0, icon: AppConstants.course, title: 'Eğitimlerim'),
  ProfileMenuItem(
      id: 1, icon: AppConstants.agreement, title: 'Kullanım Koşulları'),
  ProfileMenuItem(id: 2, icon: AppConstants.support, title: 'Destek'),
  ProfileMenuItem(id: 3, icon: AppConstants.lock, title: 'Parolamı Değiştir'),
];

Future<void> profileItemRouteHelper(BuildContext context, int index) async {
  switch (index) {
    case 0:
      break;
    case 1:
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => PrivacyPage(fromRegister: false),
          ));
      break;
    case 2:
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const ContactPage(),
          ));
      break;
    case 3:
      Navigator.push(context,
          CupertinoPageRoute(builder: (context) => PasswordRenewPage()));
      break;
    default:
      break;
  }
}
