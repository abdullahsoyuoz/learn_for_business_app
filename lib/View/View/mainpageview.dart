import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/mainpage_indexer.dart';
import 'package:learn_for_business_app/Controller/extension.dart';
import 'package:learn_for_business_app/Controller/zoom_controller.dart';
import 'package:learn_for_business_app/Model/Const/bottom_nav_bar_item.dart';
import 'package:learn_for_business_app/View/Page/Course/course_page.dart';
import 'package:learn_for_business_app/View/Page/Home/home_page.dart';
import 'package:learn_for_business_app/View/Page/Pricing/pricing_page.dart';
import 'package:learn_for_business_app/View/Page/Profile/profile_page.dart';
import 'package:learn_for_business_app/View/Style/color.dart';
import 'package:learn_for_business_app/View/View/drawer_view.dart';
import 'package:learn_for_business_app/View/Widget/custommainappbar.dart';
import 'package:provider/provider.dart';

class MainPageView extends StatelessWidget {
  MainPageView({Key key}) : super(key: key);

  final List<Widget> _views = [
    const HomePage(),
    CoursePage(),
    const PricingPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageIndexer>(builder: (context, provider, _) {
      return ZoomDrawer(
        controller: zoomController.value,
        style: DrawerStyle.defaultStyle,
        angle: 0,
        mainScreenScale: 0,
        mainScreenTapClose: true,
        moveMenuScreen: true,
        shrinkMainScreen: false,
        mainScreenOverlayColor: Colors.black.withOpacity(.55),
        menuScreenWidth: context.width * 0.8,
        slideWidth: context.width * 0.8,
        borderRadius: 0,
        menuScreen: DrawerView(),
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
              child: _views[provider.mainpageindex],
            ),
          ),
        ),
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
               GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w700),
          unselectedLabelStyle:
               GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500),
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
