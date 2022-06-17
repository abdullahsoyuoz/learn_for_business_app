import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_for_business_app/Controller/input_formatters.dart';
import 'package:learn_for_business_app/View/Page/PrivacyNTerms/privacy_policy_terms_page.dart';
import 'package:learn_for_business_app/View/Style/color.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key, required this.callback}) : super(key: key);
  final VoidCallback callback;
  final ValueNotifier<bool> checkPrivacy = ValueNotifier(false);
  final ValueNotifier<bool> obscurePassword = ValueNotifier(true);
  final ValueNotifier<bool> obscurePasswordVerification = ValueNotifier(true);

  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordVerificationController =
      TextEditingController();

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
              controller: _nicknameController,
              decoration: const InputDecoration(
                label: Text('Kullanıcı Adı'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  label: Text('E-Posta'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextFormField(
                controller: _phoneController,
                inputFormatters: [formatterPhoneWithCode],
                decoration: const InputDecoration(
                    label: Text('Telefon Numarası'),
                    hintText: '+90 ··· ··· ·· ··'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextFormField(
                controller: _birthdayController,
                inputFormatters: [formatterBirthday],
                decoration: const InputDecoration(
                    label: Text('Doğum Tarihi'), hintText: 'Gün / Ay / Yıl'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ValueListenableBuilder<bool>(
                  valueListenable: obscurePassword,
                  builder: (context, value, _) {
                    return TextFormField(
                      obscureText: value,
                      controller: _passwordController,
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
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  ValueListenableBuilder<bool>(
                      valueListenable: checkPrivacy,
                      builder: (context, value, _) {
                        return Checkbox(
                          value: value,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          activeColor: AppColor.greenDark,
                          side: BorderSide(color: AppColor.grey),
                          onChanged: (val) {
                            if (value) {
                              checkPrivacy.value = val ?? false;
                            }
                          },
                        );
                      }),
                  Expanded(
                    child: FittedBox(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Privacy policy and terms',
                            style: const TextStyle(color: Colors.blueAccent),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => PrivacyPage(
                                        callback: () {
                                          checkPrivacy.value = true;
                                        },
                                      ),
                                    ));
                              }),
                        const TextSpan(
                            text: ' \'ni Okudum ve Kabul Ediyorum.',
                            style: TextStyle(color: Colors.black)),
                      ])),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  if (checkPrivacy.value) {
                    callback.call();
                  }
                },
                child: const Text('Kayıt Olun'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
