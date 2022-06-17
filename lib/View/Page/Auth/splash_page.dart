import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_for_business_app/View/Page/Auth/auth_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => AuthPage(),
          ));
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: const SizedBox.expand(
        child: Center(child: Text('SplashPage')),
      ),
    );
  }
}
