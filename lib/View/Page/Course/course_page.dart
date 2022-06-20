// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Model/dummy_category.dart';
import 'package:learn_for_business_app/Model/dummy_course.dart';
import 'package:learn_for_business_app/View/Widget/course_card_widget.dart';

class CoursePage extends StatelessWidget {
  CoursePage({Key key}) : super(key: key);

  final TextEditingController _searchController = new TextEditingController();

  final ValueNotifier<int> dropCategory = ValueNotifier(0);
  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SizedBox.expand(
          child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        padding: const EdgeInsets.only(top: 20, bottom: 120),
        child: Column(
          children: [
            buildInputs(),
            GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final data = courseList[index];
                  return CourseItemCardWidget(data: data);
                },
                itemCount: courseList.length)
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
