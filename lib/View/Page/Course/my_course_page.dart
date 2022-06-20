import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/extension.dart';
import 'package:learn_for_business_app/Model/dummy_category.dart';
import 'package:learn_for_business_app/Model/dummy_course.dart';
import 'package:learn_for_business_app/View/Page/Course/exam_page.dart';
import 'package:learn_for_business_app/View/Page/Course/my_course_detail_page.dart';
import 'package:learn_for_business_app/View/Style/color.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';

class MyCoursePage extends StatelessWidget {
  MyCoursePage({Key key}) : super(key: key);
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = new TextEditingController();

  final ValueNotifier<int> dropCategory = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(context, 'Eğitimlerim'),
      body: SizedBox.expand(
          child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        padding: const EdgeInsets.only(top: 20, bottom: 120),
        child: Column(
          children: [
            buildInputs(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              itemCount: myCourseList.length,
              itemBuilder: (_, index) {
                final data = myCourseList[index];
                return MyCourseWidget(data: data);
              },
            )
          ],
        ),
      )),
    );
  }

  Widget buildInputs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Material(
            color: Colors.grey.shade100,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 15,
                    color: Colors.grey.shade500,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        controller: _searchController,
                        style: GoogleFonts.montserrat(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Anahtar Kelime',
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey.shade500),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 50,
                    child: Material(
                      color: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ValueListenableBuilder(
                            valueListenable: dropCategory,
                            builder: (context, value, _) {
                              return DropdownButton(
                                  isExpanded: true,
                                  value: dropCategory.value,
                                  icon: const Padding(
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: FaIcon(FontAwesomeIcons.chevronDown),
                                  ),
                                  underline: const SizedBox(),
                                  items: categoryList.map((e) {
                                    return DropdownMenuItem(
                                        value: e.id,
                                        child: Text(e.title,
                                            style: GoogleFonts.montserrat(
                                                color: Colors.grey)));
                                  }).toList(),
                                  onChanged: (index) {
                                    dropCategory.value = index;
                                  });
                            }),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          )),
                          child: const Text('Ara')),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyCourseWidget extends StatelessWidget {
  MyCourseWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  final MyCourse data;
  final bool hasExam = Random().nextBool();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const MyCourseDetailPage(),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                Container(
                    width: context.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(color: AppColor.greenDark),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            data.course.title,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Colors.white,
                            size: 15,
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Başlama Tarihi',
                              style: GoogleFonts.montserrat(
                                  color: Colors.grey.shade600),
                            ),
                            Expanded(
                                child: Text(
                              data.startDate.toStringFormat,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Son Giriş Tarihi',
                              style: GoogleFonts.montserrat(
                                  color: Colors.grey.shade600),
                            ),
                            Expanded(
                                child: Text(
                              data.lastSeen.toStringFormat,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tamamlanan',
                              style: GoogleFonts.montserrat(
                                  color: Colors.grey.shade600),
                            ),
                            Expanded(
                                child: Text(
                              data.completedContent.toString(),
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ders Notu',
                              style: GoogleFonts.montserrat(
                                  color: Colors.grey.shade600),
                            ),
                            Expanded(
                                child: Text(
                              data.dersNotu,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sınav',
                              style: GoogleFonts.montserrat(
                                  color: Colors.grey.shade600),
                            ),
                            Expanded(
                                child: Text(
                              data.sinav,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sertifika',
                              style: GoogleFonts.montserrat(
                                  color: Colors.grey.shade600),
                            ),
                            Expanded(
                                child: Text(
                              data.sertifika,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                hasExam
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const ExamPage(),
                                  ));
                            },
                            child: const Text('Sınava Başla')),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
