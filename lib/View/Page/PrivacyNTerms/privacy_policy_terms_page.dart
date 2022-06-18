import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:learn_for_business_app/Controller/utility.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';

// ignore: must_be_immutable
class PrivacyPage extends StatelessWidget {
  PrivacyPage({Key key, this.callback, this.fromRegister = true})
      : super(key: key);
  final VoidCallback callback;
  bool fromRegister;

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(context, 'Gizlilik Sözleşmesi'),
      body: SizedBox.expand(
        child: Stack(
          fit: StackFit.expand,
          children: [
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  top: 30,
                  bottom: context.paddingBottom * 5,
                  left: 20,
                  right: 20),
              children: [
                const Text(
                  '1. Gizlilik Sözleşmesi',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    Faker().lorem.sentences(10).toString().replaceAll('[', '').replaceAll(']', ''),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    '2. Kullanım Koşulları',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    Faker().lorem.sentences(10).toString().replaceAll('[', '').replaceAll(']', ''),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    '3. Politikalar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    Faker().lorem.sentences(10).toString().replaceAll('[', '').replaceAll(']', ''),
                  ),
                ),
              ],
            ),
            !fromRegister ? const SizedBox() : Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: context.paddingBottom * 1,
                  left: 20,
                  right: 20,
                ),
                child: SizedBox(
                  height: 70,
                  child: ElevatedButton(
                      onPressed: () {
                        callback?.call();
                        Navigator.pop(context);
                      },
                      child: const Text('Okudum ve Onaylıyorum')),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
