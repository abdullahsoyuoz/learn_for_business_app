import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:learn_for_business_app/Controller/mainpage_indexer.dart';
import 'package:learn_for_business_app/Controller/utility.dart';
import 'package:learn_for_business_app/Controller/zoom_controller.dart';
import 'package:learn_for_business_app/Model/bottom_nav_bar_item.dart';
import 'package:learn_for_business_app/View/Style/color.dart';
import 'package:learn_for_business_app/View/View/drawer_view.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';
import 'package:learn_for_business_app/View/Widget/custommainappbar.dart';
import 'package:provider/provider.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageIndexer>(builder: (context, provider, _) {
      return ValueListenableBuilder<ZoomDrawerController>(
        valueListenable: zoomController,
        builder: (context, value, _) {
          return ZoomDrawer(
            controller: zoomController.value,
            style: DrawerStyle.defaultStyle,
            angle: 0,
            mainScreenScale: 0,
            mainScreenTapClose: true,
            moveMenuScreen: true,
            shrinkMainScreen: false,
            mainScreenOverlayColor: Colors.black.withOpacity(.75),
            menuScreenWidth: context.width * 0.85,
            slideWidth: context.width * 0.85,
            borderRadius: 0,
            menuScreen: const DrawerView(),
            mainScreen: Scaffold(
              appBar: customMainAppbar(context, provider.mainpageindex),
              bottomNavigationBar: buildNavBar(),
              body: SizedBox.expand(
                child: PageTransitionSwitcher(
                  transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                    return SharedAxisTransition(
                      animation: primaryAnimation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.scaled,
                      child: child,
                    );
                  },
                ),
              ),
            ),
          );
        }
      );
    });
  }

  Widget buildNavBar() {
    return Consumer<MainPageIndexer>(builder: (context, provider, _) {
      return BottomNavigationBar(
          currentIndex: provider.mainpageindex,
          onTap: (index) => provider.setIndex = index,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          unselectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          selectedItemColor: AppColor.greenDark,
          unselectedItemColor: AppColor.grey,
          items: navbarList
              .map(
                (e) => BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Image.asset(
                      e.icon,
                      color: AppColor.grey,
                      width: 25,
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Image.asset(
                      e.icon,
                      color: AppColor.greenDark,
                      width: 25,
                    ),
                  ),
                  label: e.title,
                ),
              )
              .toList());
    });
  }
}
