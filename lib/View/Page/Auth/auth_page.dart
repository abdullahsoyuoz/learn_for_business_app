import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/asset_constants.dart';
import 'package:learn_for_business_app/Controller/extension.dart';
import 'package:learn_for_business_app/View/Page/Auth/login_view.dart';
import 'package:learn_for_business_app/View/Page/Auth/register_view.dart';
import 'package:learn_for_business_app/View/Style/color.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key key}) : super(key: key);

  final ValueNotifier<bool> isRegister = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

    return ValueListenableBuilder<bool>(
        valueListenable: isRegister,
        builder: (context, value, _) {
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.grey.shade300,
            body: SizedBox.expand(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: value
                          ? context.height * 0.3
                          : context.height * 0.6,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          SizedBox.expand(
                            child: Image.asset(
                              AppConstants.loginBack,
                              width: context.width,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Center(
                            child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 500),
                                opacity: value ? 0 : 1,
                                child: Image.asset(AppConstants.logoWT,
                                    width: context.width * 0.3)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: context.paddingTop,
                                right: context.paddingTop * 0.5),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: () {
                                  isRegister.value = !value;
                                },
                                style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                        AppColor.greenDark),
                                    textStyle: MaterialStateProperty.all(
                                        GoogleFonts.montserrat(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600))),
                                child: AnimatedCrossFade(
                                  duration: const Duration(milliseconds: 500),
                                  firstCurve: Curves.easeOutQuint,
                                  secondCurve: Curves.easeInQuint,
                                  crossFadeState: value
                                      ? CrossFadeState.showFirst
                                      : CrossFadeState.showSecond,
                                  firstChild: const Text('Giriş Yap'),
                                  secondChild: const Text('Kayıt Ol'),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: context.paddingTop,
                                left: 30,
                                bottom: context.height * 0.1),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.zero),
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    textStyle: MaterialStateProperty.all(
                                        GoogleFonts.montserrat(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600))),
                                child: AnimatedCrossFade(
                                  duration: const Duration(milliseconds: 500),
                                  firstCurve: Curves.easeOutQuint,
                                  secondCurve: Curves.easeInQuint,
                                  crossFadeState: value
                                      ? CrossFadeState.showFirst
                                      : CrossFadeState.showSecond,
                                  secondChild: const Text('Giriş Yap'),
                                  firstChild: const Text('Kayıt Ol'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: context.width,
                      height: value
                          ? context.height * 0.8
                          : context.height * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                offset: const Offset(0, -1),
                                blurRadius: 3)
                          ]),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(50),
                                )),
                            child: PageTransitionSwitcher(
                              transitionBuilder: (child, primaryAnimation,
                                  secondaryAnimation) {
                                return SharedAxisTransition(
                                  animation: primaryAnimation,
                                  secondaryAnimation: secondaryAnimation,
                                  transitionType:
                                      SharedAxisTransitionType.vertical,
                                  child: child,
                                );
                              },
                              duration: const Duration(milliseconds: 500),
                              child: value
                                  ? RegisterView(
                                      callback: () {
                                        isRegister.value = false;
                                      },
                                    )
                                  : LoginView(),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
