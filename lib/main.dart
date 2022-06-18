import 'package:flutter/material.dart';
import 'package:learn_for_business_app/Controller/mainpage_indexer.dart';
import 'package:learn_for_business_app/View/Page/Auth/auth_page.dart';
import 'package:learn_for_business_app/View/Style/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MainPageIndexer(),
      )
    ],
    builder: (context, _) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: const AppStarter(),
    ),
  ));
}

class AppStarter extends StatelessWidget {
  const AppStarter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthPage();
  }
}
