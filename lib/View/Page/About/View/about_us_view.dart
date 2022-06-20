import 'package:flutter/material.dart';
import 'package:learn_for_business_app/Controller/constant_texts.dart';
import 'package:learn_for_business_app/Controller/extension.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: SizedBox.expand(
        child: SingleChildScrollView(
         physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          child: Column(
            children: [
              Image.asset(
                'assets/image/dummy_about_1.jpg',
                width: context.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Text(ctaboutUsDescription),
              )
            ],
          ),
        ),
      ),
    );
  }
}
