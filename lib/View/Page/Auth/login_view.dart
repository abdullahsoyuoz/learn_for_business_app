// ignore_for_file: prefer_final_fields, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_for_business_app/View/Page/Auth/forgot_password_page.dart';
import 'package:learn_for_business_app/View/View/mainpageview.dart';

class LoginView extends StatelessWidget {
  LoginView({Key key}) : super(key: key);
  final ValueNotifier<bool> obscure = ValueNotifier(true);

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              textInputAction: TextInputAction.next,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                label: Text('E-Posta Adresi'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ValueListenableBuilder<bool>(
                valueListenable: obscure,
                builder: (context, value, _) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: value,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      label: const Text('Parola'),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: GestureDetector(
                            onTap: () {
                              obscure.value = !value;
                            },
                            child: FaIcon(
                              value
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: 15,
                            )),
                      ),
                      suffixIconConstraints: const BoxConstraints(maxHeight: 15),
                    ),
                  );
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) =>  MainPageView(),
                      ));
                },
                child: const Text('Giriş'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ForgotPasswordPage()));
                },
                child: const Text('Şifremi Unuttum'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
