import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/asset_constants.dart';
import 'package:learn_for_business_app/Controller/zoom_controller.dart';
import 'package:learn_for_business_app/View/Style/color.dart';

AppBar customMainAppbar(
  BuildContext context,
  int mainIndex, {
  List<Widget> actions = const [SizedBox()],
  double elevation = 1,
}) {
  return AppBar(
      toolbarHeight: 95,
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      shadowColor: Colors.grey.shade200,
      elevation: elevation,
      actions: actions,
      leading: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: zoomController.value.isOpen!.call() ? 0 : 1,
        child: GestureDetector(
          onTap: () {
            zoomController.value.toggle!.call();
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                width: 40,
                height: 40,
                child: Material(
                  elevation: 3,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.bars,
                      color: AppColor.greenDark,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      title: getTitle(mainIndex));
}

Widget getTitle(int index) {
  switch (index) {
    case 0:
      return Image.asset(
        AppConstants.logoWT_alt,
        height: 50,
      );
    case 1:
      return const Text(
        'Eğitimler',
        style: TextStyle(color: Colors.black),
      );
    case 2:
      return const Text(
        'Fiyatlarımız',
        style: TextStyle(color: Colors.black),
      );
    case 3:
      return const Text(
        'Profilim',
        style: TextStyle(color: Colors.black),
      );
    default:
      return const SizedBox();
  }
}
