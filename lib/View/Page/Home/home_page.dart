import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/extension.dart';
import 'package:learn_for_business_app/Model/dummy_course.dart';
import 'package:learn_for_business_app/View/Widget/course_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: SizedBox.expand(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.width,
              height: 250,
              child: const ColoredBox(color: Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Text(
                'Popüler Kurslar',
                style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
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
}
