import 'package:flutter/material.dart';

class ContactInfoView extends StatelessWidget {
  const ContactInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      key: scaffoldKey,
      body: const SizedBox.expand(
        child: Center(child: Text('ContactInfoView')),
      ),
    );
  }
}
