import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:learn_for_business_app/View/Page/Contact/View/contact_form_view.dart';
import 'package:learn_for_business_app/View/Page/Contact/View/contact_info_view.dart';
import 'package:learn_for_business_app/View/Style/color.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with SingleTickerProviderStateMixin {
  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  TabController tabController;

  final List<Widget> _views = [
    const ContactFormView(),
    const ContactInfoView(),
  ];

  final List<Widget> _tabs = ['İletişim Formu', 'İletişim Bilgileri'].map((e) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: FittedBox(
        child: Text(
          e,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
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
      appBar: customAppBar(context, 'İletişim'),
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
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              ),
            ))
          ],
        ),
      ),
    );
  }
}
