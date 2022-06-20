import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/View/Style/color.dart';

AppBar customAppBar(
  BuildContext context,
  String title, {
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
      onTap: () => Navigator.pop(context),
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
                  FontAwesomeIcons.chevronLeft,
                  color: AppColor.greenDark,
                  size: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    title: title == null ? const SizedBox() : FittedBox(
      child: Text(
        title,
        style: GoogleFonts.montserrat(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
