import 'package:flutter/material.dart';

class BusinessView extends StatelessWidget {
  const BusinessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      key: scaffoldKey,
      body: const SizedBox.expand(
        child: Center(child: Text('BusinessView')),
      ),
    );
  }
}
