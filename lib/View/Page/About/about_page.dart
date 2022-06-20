import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/View/Page/About/View/about_us_view.dart';
import 'package:learn_for_business_app/View/Page/About/View/mission_view.dart';
import 'package:learn_for_business_app/View/Page/About/View/staff_view.dart';
import 'package:learn_for_business_app/View/Page/About/View/vision_view.dart';
import 'package:learn_for_business_app/View/Style/color.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  TabController tabController;

  final List<Widget> _views = const [
    AboutUsView(),
    MissionView(),
    VisionView(),
    StaffView(),
  ];

  final List<Widget> _tabs =
      ['Hikayemiz', 'Misyon', 'Vizyon', 'Kadro'].map((e) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: FittedBox(
          child: Text(
            e,
            style: GoogleFonts.montserrat(color: Colors.black),
          ),
        ));
  }).toList();

  @override
  void initState() {
    tabController = TabController(length: _views.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(context, 'Hakkımızda'),
      body: SizedBox.expand(
        child: Column(
          children: [
            TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 5,
                indicatorColor: AppColor.green,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                padding: const EdgeInsets.only(top: 20),
                onTap: (i) {
                  setState(() {});
                },
                tabs: _tabs),
            Expanded(
                child: PageTransitionSwitcher(
                  transitionBuilder:
                      (child, primaryAnimation, secondaryAnimation) {
                    return SharedAxisTransition(
                      animation: primaryAnimation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.vertical,
                      child: child,
                    );
                  },
                  child: _views[tabController.index],
                ))
          ],
        ),
      ),
    );
  }
}
