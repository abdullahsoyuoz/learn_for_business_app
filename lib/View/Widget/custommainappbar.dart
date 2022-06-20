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
      toolbarHeight: 75,
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      shadowColor: Colors.grey.shade200,
      elevation: elevation,
      actions: actions,
      leading: GestureDetector(
        onTap: () {
          zoomController.value.toggle.call();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SizedBox(
            width: 40,
            height: 40,
            child: Material(
              elevation: 0,
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
      title: getTitle(mainIndex));
}

Widget getTitle(int index) {
  switch (index) {
    case 0:
      return Image.asset(
        AppConstants.logoWTAlt,
        height: 50,
      );
    case 1:
      return Text(
        'Kurslar',
        style: GoogleFonts.montserrat(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      );
    case 2:
      return Text(
        'Fiyatlarımız',
        style: GoogleFonts.montserrat(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      );
    case 3:
      return Text(
        'Profilim',
        style: GoogleFonts.montserrat(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      );
    default:
      return const SizedBox();
  }
}
