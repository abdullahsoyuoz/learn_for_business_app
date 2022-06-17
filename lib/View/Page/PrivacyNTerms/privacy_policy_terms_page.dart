import 'package:flutter/material.dart';
import 'package:learn_for_business_app/Controller/utility.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key, this.callback}) : super(key: key);
  final VoidCallback? callback;

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
            ListView.builder(
              shrinkWrap: true,
              padding:
                  EdgeInsets.only(top: 30, bottom: context.paddingBottom * 5),
              itemCount: 50,
              itemBuilder: (c, i) {
                return SizedBox(
                  height: 20,
                  child: Center(
                    child: Text(i.toString()),
                  ),
                );
              },
            ),
            Align(
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
