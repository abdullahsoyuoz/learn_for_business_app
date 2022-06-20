import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/extension.dart';
import 'package:learn_for_business_app/View/Style/color.dart';

class CustomDialog extends StatelessWidget {
  final Widget child;
  final String title;
  final String description;
  final String icon;
  final String buttonTitle;
  final VoidCallback callback;
  final bool isTransparent;
  const CustomDialog(
      {Key key,
      this.child,
      this.isTransparent = false,
      this.buttonTitle,
      this.callback,
      this.description,
      this.icon = 'assets/icon/check_circle.png',
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
        child: StatefulBuilder(builder: (context, setState) {
          return Dialog(
            elevation: isTransparent ? 0 : 10,
            backgroundColor: Colors.transparent,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Container(
                    width: context.width * 0.9,
                    height: context.width * 0.9,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isTransparent ? Colors.transparent : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                description,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          icon,
                          width: context.width * 0.3,
                        ),
                        ElevatedButton(
                            onPressed: callback,
                            child: Text(
                              buttonTitle,
                              style: GoogleFonts.montserrat(
                                  color: AppColor.greenDark,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
