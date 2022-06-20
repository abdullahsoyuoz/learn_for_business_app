import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/constant_texts.dart';
import 'package:learn_for_business_app/Controller/extension.dart';
import 'package:learn_for_business_app/View/Page/Auth/new_password_page.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:learn_for_business_app/View/Style/color.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({Key key}) : super(key: key);

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
   TextEditingController _pincodeController;

  @override
  void initState() {
    _pincodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          Text(
            'Doğrulama\nKodunu Gir',
            style: GoogleFonts.montserrat(fontSize: 26, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(ctpincodeDescription),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: PinCodeTextField(
              appContext: context,
              length: 4,
              controller: _pincodeController,
              autovalidateMode: AutovalidateMode.always,
              enableActiveFill: true,
              keyboardType: TextInputType.phone,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: context.width * 0.15,
                fieldWidth: context.width * 0.15,
                activeColor: Colors.transparent,
                disabledColor: Colors.transparent,
                inactiveColor: Colors.transparent,
                selectedColor: Colors.transparent,
                activeFillColor: AppColor.greyLight,
                selectedFillColor: AppColor.greyLight,
                inactiveFillColor: AppColor.greyLight,
              ),
              onChanged: (s) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => NewPasswordPage(),
                      ));
                },
                child: const Text('Onayla')),
          )
        ],
      ),
    );
  }
}
