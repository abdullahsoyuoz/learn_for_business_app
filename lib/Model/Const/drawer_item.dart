import 'package:flutter/cupertino.dart';
import 'package:learn_for_business_app/Controller/mainpage_indexer.dart';
import 'package:learn_for_business_app/Controller/zoom_controller.dart';
import 'package:learn_for_business_app/View/Page/About/about_page.dart';
import 'package:learn_for_business_app/View/Page/Contact/contact_page.dart';
import 'package:learn_for_business_app/View/Page/Course/my_course_page.dart';
import 'package:learn_for_business_app/View/Page/PrivacyNTerms/privacy_policy_terms_page.dart';
import 'package:learn_for_business_app/View/Page/Questions/faq_page.dart';
import 'package:provider/provider.dart';

class DrawerItem {
  int index;
  String title;
  DrawerItem({
    this.index,
    this.title,
  });
}

List<DrawerItem> drawerList = [
  DrawerItem(index: 0, title: 'Eğitimler'),
  DrawerItem(index: 1, title: 'Fiyatlar'),
  DrawerItem(index: 2, title: 'Hakkımızda'),
  DrawerItem(index: 3, title: 'İletişim'),
  DrawerItem(index: 4, title: 'Kullanım Koşulları'),
  DrawerItem(index: 5, title: 'Sıkça Sorulan Sorular'),
];

Future<void> drawerItemRouteHelper(BuildContext context, int index) async {
  switch (index) {
    case 0:
      Future(() {
        zoomController.value.close.call();
      }).whenComplete(() {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => MyCoursePage(),
            ));
      });
      break;
    case 1:
      Future(() {
        zoomController.value.close.call();
      }).whenComplete(() {
        Provider.of<MainPageIndexer>(context, listen: false).setIndex(2);
      });
      break;
    case 2:
      Future(() {
        zoomController.value.close.call();
      }).whenComplete(() {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const AboutPage(),
            ));
      });
      break;
    case 3:
      Future(() {
        zoomController.value.close.call();
      }).whenComplete(() {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const ContactPage(),
            ));
      });
      break;
    case 4:
      Future(() {
        zoomController.value.close.call();
      }).whenComplete(() {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) =>
                  PrivacyPage(fromRegister: false, callback: () {}),
            ));
      });
      break;
    case 5:
      Future(() {
        zoomController.value.close.call();
      }).whenComplete(() {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const FrequentlyAskedQuestionPage(),
            ));
      });
      break;
    default:
  }
}
