// ignore_for_file: unnecessary_new

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/extension.dart';
import 'package:learn_for_business_app/Controller/input_formatters.dart';
import 'package:learn_for_business_app/Model/Const/pricing.dart';
import 'package:learn_for_business_app/View/Style/color.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';

class CoursePaymentPage extends StatefulWidget {
  const CoursePaymentPage({Key key}) : super(key: key);

  @override
  State<CoursePaymentPage> createState() => _CoursePaymentPageState();
}

class _CoursePaymentPageState extends State<CoursePaymentPage> {
  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  int dropValue;
  int radioValue = 0;
  int selectedPaymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    List<Widget> _paymentViews = [
      PaymentWithCreditView(),
      const SizedBox(),
    ];
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(context, 'Satın Al'),
      body: SizedBox.expand(
          child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 200),
        child: Column(
          children: [
            Text(
              'Bütün eğitimlere hemen erişim sağlayın',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                'Bir kerelik 300 TL ödeyerek 1 yıl boyunca tüm eğitimlerimizden sınırsız yararlanın.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Paket Seçimi',
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      height: 50,
                      child: Material(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side:
                                const BorderSide(width: 2, color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: DropdownButton(
                              isExpanded: true,
                              value: dropValue,
                              hint: DropdownMenuItem(
                                  child: Text('Paket Seçiniz',
                                      style: GoogleFonts.montserrat(
                                          color: Colors.grey))),
                              icon: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: FaIcon(FontAwesomeIcons.chevronDown),
                              ),
                              underline: const SizedBox(),
                              items: pricingList.map((e) {
                                return DropdownMenuItem(
                                    value: e.id,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(e.title,
                                              style: GoogleFonts.montserrat(
                                                  color: Colors.black)),
                                        ),
                                        e.fee == null ? const SizedBox() : Text('${e.fee} TL',
                                            style: GoogleFonts.montserrat(
                                                color: AppColor.greenDark,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ));
                              }).toList(),
                              onChanged: (index) {
                                setState(() {
                                  dropValue = index;
                                });
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ödeme Seçeneği',
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      height: 50,
                      child: Material(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(width: 2, color: Colors.grey),
                        ),
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Radio(
                                          value: 0,
                                          groupValue: radioValue,
                                          fillColor: MaterialStateProperty.all(
                                              AppColor.greenDark),
                                          activeColor: AppColor.greenDark,
                                          onChanged: (index) {
                                            setState(() {
                                              radioValue = index;
                                            });
                                          }),
                                      const Text('Kredi Kartı')
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Radio(
                                          value: 1,
                                          groupValue: radioValue,
                                          fillColor: MaterialStateProperty.all(
                                              AppColor.greenDark),
                                          activeColor: AppColor.greenDark,
                                          onChanged: (index) {
                                            setState(() {
                                              radioValue = index;
                                            });
                                          }),
                                      const Text('Banka Kartı')
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: DefaultTabController(
                  length: 2,
                  child: TabBar(
                      indicatorColor: AppColor.green,
                      indicatorWeight: 5,
                      indicatorSize: TabBarIndicatorSize.label,
                      onTap: (value) {
                        setState(() {
                          selectedPaymentMethod = value;
                        });
                      },
                      tabs: [
                        Tab(
                          child: Text(
                            'Kart ile Ödeme',
                            style: TextStyle(
                                color: selectedPaymentMethod == 0
                                    ? Colors.black
                                    : Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Iyzico ile Ödeme',
                            style: TextStyle(
                                color: selectedPaymentMethod == 1
                                    ? Colors.black
                                    : Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ])),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: context.width,
                child: PageTransitionSwitcher(
                  transitionBuilder:
                      (child, primaryAnimation, secondaryAnimation) {
                    return SharedAxisTransition(
                      animation: primaryAnimation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.scaled,
                      child: child,
                    );
                  },
                  child: _paymentViews[selectedPaymentMethod],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class PaymentWithCreditView extends StatelessWidget {
  PaymentWithCreditView({Key key}) : super(key: key);

  final TextEditingController _creditNameController = new TextEditingController();
  final TextEditingController _creditNumberController = new TextEditingController();
  final TextEditingController _creditExpiredDateController = new TextEditingController();
  final TextEditingController _creditCVVController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Paket Seçimi',
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextFormField(
                controller: _creditNameController,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.montserrat(color: Colors.black),
                decoration: const InputDecoration(
                  label: Text('Kart Üzerindeki Ad Soyad'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextFormField(
                controller: _creditNumberController,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.montserrat(color: Colors.black),
                inputFormatters: [formatterCreditCard],
                decoration: const InputDecoration(
                  label: Text('Kart Numarası'),
                  hintText: '···· ···· ···· ····'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _creditExpiredDateController,
                      textInputAction: TextInputAction.next,
                      style: GoogleFonts.montserrat(color: Colors.black),
                      inputFormatters: [formatterExpiredDate],
                      decoration: const InputDecoration(
                        label: Text('Ay / Yıl'),
                        hintText: '·· / ··'
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: TextFormField(
                      controller: _creditCVVController,
                      textInputAction: TextInputAction.next,
                      style: GoogleFonts.montserrat(color: Colors.black),
                      inputFormatters: [formatterCVV],
                      decoration: const InputDecoration(
                        label: Text('CVV'),
                        hintText: '···'
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20), child: Text('Kredi kartı ödeme sistemi Türkiye’nin önde gelen ödeme sistemi olan iyzico tarafindan sağlanmaktadır. Kredi kartı bilgileriniz hiç bir şekilde saklanmamaktadir.', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),),
            const Padding(padding: EdgeInsets.only(top: 20), child: Text('Ödeme işlemine devam ettiğiniz takdirde Mesafeli Satış Sözleşmesini kabul etmiş sayılırsınız.', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),),
            Padding(padding: const EdgeInsets.only(top: 20), child: ElevatedButton(onPressed: (){}, child: const Text('Ödeme Yap')),),
          ],
        ),
      ),
    );
  }
}
