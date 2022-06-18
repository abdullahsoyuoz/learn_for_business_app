import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_for_business_app/Controller/constant_texts.dart';
import 'package:learn_for_business_app/Controller/input_formatters.dart';
import 'package:learn_for_business_app/View/Page/Auth/phone_verification_page.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key key}) : super(key: key);
  final TextEditingController _phoneController = TextEditingController();

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
          const Text(
            'Şifremi\nUnuttum',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(ctforgotPasswordDescription),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: TextFormField(
              controller: _phoneController,
              inputFormatters: [formatterPhoneWithCode],
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                  label: Text('Telefon Numarası'),
                  hintText: '+90 ··· ··· ·· ··'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const PhoneVerificationPage(),
                      ));
                },
                child: const Text('Doğrulama Kodu Gönder')),
          )
        ],
      ),
    );
  }
}
