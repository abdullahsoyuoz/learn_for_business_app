import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';

class PasswordRenewPage extends StatelessWidget {
  PasswordRenewPage({Key key}) : super(key: key);

  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> obscureCurrentPassword = ValueNotifier(true);
  final ValueNotifier<bool> obscurePassword = ValueNotifier(true);
  final ValueNotifier<bool> obscurePasswordVerification = ValueNotifier(true);

  final TextEditingController _passwordCurrentController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordVerificationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        key: scaffoldKey,
        appBar: customAppBar(context, "Parolamı Değiştir"),
        body: SizedBox.expand(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 120),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ValueListenableBuilder<bool>(
                    valueListenable: obscureCurrentPassword,
                    builder: (context, value, _) {
                      return TextFormField(
                        obscureText: value,
                        controller: _passwordCurrentController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          label: const Text('Güncel Parola'),
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
                    valueListenable: obscurePassword,
                    builder: (context, value, _) {
                      return TextFormField(
                        obscureText: value,
                        controller: _passwordController,
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
                        obscureText: value,
                        textInputAction: TextInputAction.done,
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
                      Navigator.pop(context);
                    },
                    child: const Text('Parolamı Değiştir')),
              )
            ],
          ),
        )),
      ),
    );
  }
}
