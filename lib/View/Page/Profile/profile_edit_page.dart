import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Model/fake_user.dart';
import 'package:learn_for_business_app/View/Style/color.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _nameController =
      TextEditingController(text: user.name.split(' ').first);

  final TextEditingController _surnameController =
      TextEditingController(text: user.name.split(' ')[1]);

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _unvanController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  int dropCity;

  int dropProvince;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(context, "Profilim"),
      body: SizedBox.expand(
          child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 120),
        child: buildInputs(context),
      )),
    );
  }

  Column buildInputs(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _nameController,
          textInputAction: TextInputAction.next,
          style:  GoogleFonts.montserrat(color: Colors.black),
          decoration: const InputDecoration(
            label: Text('Ad'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextFormField(
            controller: _surnameController,
            textInputAction: TextInputAction.next,
            style:  GoogleFonts.montserrat(color: Colors.black),
            decoration: const InputDecoration(
              label: Text('Soyad'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextFormField(
            controller: _unvanController,
            textInputAction: TextInputAction.next,
            style:  GoogleFonts.montserrat(color: Colors.black),
            decoration: const InputDecoration(
              label: Text('Ünvan'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextFormField(
            controller: _phoneController,
            textInputAction: TextInputAction.next,
            style:  GoogleFonts.montserrat(color: Colors.black),
            decoration: const InputDecoration(
              label: Text('Telefon'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextFormField(
            controller: _emailController,
            textInputAction: TextInputAction.next,
            style:  GoogleFonts.montserrat(color: Colors.black),
            decoration: const InputDecoration(
              label: Text('E-Posta'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.greyLight, width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton(
                isExpanded: true,
                value: dropCity,
                hint: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'İl',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: AppColor.grey,
                    ),
                  ),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: FaIcon(FontAwesomeIcons.chevronDown),
                ),
                underline: const SizedBox(),
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'İstanbul',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Kocaeli',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
                onChanged: (index) {
                  setState(() {
                    dropCity = index;
                  });
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.greyLight, width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton(
                isExpanded: true,
                value: dropProvince,
                hint: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'İlçe',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: AppColor.grey,
                    ),
                  ),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: FaIcon(FontAwesomeIcons.chevronDown),
                ),
                underline: const SizedBox(),
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'İstanbul',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Kocaeli',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
                onChanged: (index) {
                  setState(() {
                    dropProvince = index;
                  });
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextFormField(
            controller: _addressController,
            textInputAction: TextInputAction.done,
            maxLines: 10,
            style:  GoogleFonts.montserrat(color: Colors.black),
            decoration: const InputDecoration(
                label: Text('Adres'),
                hintText: 'Adresiniz',
                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Güncelle')),
        )
      ],
    );
  }
}
