import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_for_business_app/View/Page/Getting%20Started/forgot_password_page.dart';
import 'package:learn_for_business_app/View/View/mainpageview.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  ValueNotifier<bool> obscure = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: obscure,
        builder: (context, value, _) {
          return SizedBox.expand(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('E-Posta Adresi'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      obscureText: value,
                      decoration: InputDecoration(
                        label: Text('Parola'),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: GestureDetector(
                              onTap: () {
                                obscure.value = !value;
                              },
                              child: FaIcon(value ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash, size: 15,)),
                        ),
                        suffixIconConstraints:
                            const BoxConstraints(maxHeight: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MainPageView(),
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
                                builder: (context) =>
                                    const ForgotPasswordPage()));
                      },
                      child: const Text('Şifremi Unuttum'),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
