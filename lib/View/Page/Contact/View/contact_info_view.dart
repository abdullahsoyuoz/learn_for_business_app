import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/asset_constants.dart';

class ContactInfoView extends StatelessWidget {
  const ContactInfoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        body: ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          padding: const EdgeInsets.only(bottom: 120),
          itemCount: _dataList.length,
          itemBuilder: (context, index) {
            final data = _dataList[index];
            return ContactInfoItemWidget(data: data);
          },
        ));
  }
}

class ContactInfoItemWidget extends StatelessWidget {
  const ContactInfoItemWidget({
    Key key,
    // ignore: library_private_types_in_public_api
    this.data,
  }) : super(key: key);

  // ignore: library_private_types_in_public_api
  final _Data data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        color: Colors.grey.shade100,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    data.icon,
                    width: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      data.title,
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  data.description,
                  style:
                      GoogleFonts.montserrat(fontSize: 16, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Data {
  String title;
  String description;
  String icon;
  _Data({this.title, this.description, this.icon});
}

List<_Data> _dataList = [
  _Data(
      title: 'Kocaeli Ofisi',
      description: 'Karaer Danışmanlık Ltd. Şti.',
      icon: AppConstants.office),
  _Data(
      title: 'E-posta',
      description: 'info@learnforbusiness.com',
      icon: AppConstants.envelope),
  _Data(
      title: 'Telefon',
      description: '+90 533 813 25 30',
      icon: AppConstants.phone),
  _Data(
      title: 'Adres',
      description:
          'PiriReis Mah. Yelkenkaya Cad. Yosun Sok. No:24/2, 41400 Darıca/Kocaeli',
      icon: AppConstants.location),
];
