import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/asset_constants.dart';
import 'package:learn_for_business_app/Controller/mainpage_indexer.dart';
import 'package:learn_for_business_app/Controller/extension.dart';
import 'package:learn_for_business_app/Controller/zoom_controller.dart';
import 'package:learn_for_business_app/Model/fake_user.dart';
import 'package:learn_for_business_app/Model/Const/drawer_item.dart';
import 'package:learn_for_business_app/View/Style/color.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatelessWidget {
  DrawerView({Key key}) : super(key: key);
  final ValueNotifier<bool> isAnonim = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

    return Consumer<MainPageIndexer>(builder: (context, provider, _) {
      return ValueListenableBuilder(
          valueListenable: isAnonim,
          builder: (context, value, _) {
            return Scaffold(
                key: scaffoldKey,
                body: SizedBox.expand(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: context.paddingBottom),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          physics: const AlwaysScrollableScrollPhysics(
                              parent: BouncingScrollPhysics()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Future(() {
                                    zoomController.value.close.call();
                                  }).whenComplete(() => provider.setIndex = 0);
                                },
                                child: SizedBox(
                                  width: context.width,
                                  height: 150,
                                  child: DrawerHeader(
                                    child: Center(
                                      child: Image.asset(AppConstants.logoWTAlt,
                                          width: context.width * 0.3),
                                    ),
                                  ),
                                ),
                              ),
                              !value ? const SizedBox() : Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Future(() {
                                      zoomController.value.close.call();
                                    }).whenComplete(
                                        () => provider.setIndex = 3);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Merhaba',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.grey.shade600,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          user.name,
                                          style:  GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.only(top: 20),
                                itemCount: drawerList.length,
                                itemBuilder: (context, index) {
                                  final data = drawerList[index];
                                  return DrawerItemWidget(data: data);
                                },
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: value
                                ? OutlinedButton(
                                    onPressed: () {
                                      isAnonim.value = !value;
                                    },
                                    child: const Text('Çıkış Yap'))
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: ElevatedButton(
                                              onPressed: () {
                                                isAnonim.value = !value;
                                              },
                                              child: const Text('Giriş Yap'))),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                          child: OutlinedButton(
                                              onPressed: () {
                                                isAnonim.value = !value;
                                              },
                                              child: const Text('Kayıt Ol'))),
                                    ],
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                ));
          });
    });
  }
}

class DrawerItemWidget extends StatelessWidget {
  const DrawerItemWidget({
    Key key,
    this.data,
  }) : super(key: key);

  final DrawerItem data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: () => drawerItemRouteHelper(context, data.index),
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade100),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColor.greenDark;
              }
              return Colors.black;
            }),
            textStyle: MaterialStateProperty.all(
                GoogleFonts.montserrat(fontWeight: FontWeight.w400))),
        child: SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.title,
                  style:  GoogleFonts.montserrat(fontSize: 16),
                ),
                const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
