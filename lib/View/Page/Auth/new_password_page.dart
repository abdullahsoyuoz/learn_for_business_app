// ignore_for_file: unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/constant_texts.dart';
import 'package:learn_for_business_app/View/Page/Auth/auth_page.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';
import 'package:learn_for_business_app/View/Widget/dialog_widget.dart';

class NewPasswordPage extends StatelessWidget {
  NewPasswordPage({Key key}) : super(key: key);

  final ValueNotifier<bool> obscurePassword = ValueNotifier(true);
  final ValueNotifier<bool> obscurePasswordVerification = ValueNotifier(true);

  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _passwordVerificationController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(context, null, elevation: 0),
      body: ListView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 120),
        children: [
          Text(
            'Yeni Parola\nOluştur',
            style: GoogleFonts.montserrat(
                fontSize: 26, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(ctnewPasswordDescription),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: ValueListenableBuilder<bool>(
                valueListenable: obscurePassword,
                builder: (context, value, _) {
                  return TextFormField(
                    obscureText: value,
                    controller: _passwordController,
                    style: GoogleFonts.montserrat(color: Colors.black),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: const Text('Parola'),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: GestureDetector(
                            onTap: () {
                              obscurePassword.value = !value;
                            },
                            child: FaIcon(
                              value
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: 15,
                            )),
                      ),
                      suffixIconConstraints:
                          const BoxConstraints(maxHeight: 15),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ValueListenableBuilder<bool>(
                valueListenable: obscurePasswordVerification,
                builder: (context, value, _) {
                  return TextFormField(
                    controller: _passwordVerificationController,
                    style: GoogleFonts.montserrat(color: Colors.black),
                    obscureText: value,
                    decoration: InputDecoration(
                      label: const Text('Parola (Tekrar)'),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: GestureDetector(
                            onTap: () {
                              obscurePasswordVerification.value = !value;
                            },
                            child: FaIcon(
                              value
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: 15,
                            )),
                      ),
                      suffixIconConstraints:
                          const BoxConstraints(maxHeight: 15),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (context) => AuthPage(),
                  //   ),
                  //   (route) => false,
                  // );
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialog(
                          isTransparent: false,
                          callback: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => AuthPage(),
                                ),
                                (route) => false).whenComplete(() {
                              _passwordController.dispose();
                              _passwordVerificationController.dispose();
                            });
                          },
                          title: 'Tebrikler',
                          description: forgotPasswordDialogDesciprion,
                          buttonTitle: 'Giriş Ekranına Dön',
                        );
                      });
                },
                child: const Text('Parolamı Kaydet')),
          )
        ],
      ),
    );
  }
}
