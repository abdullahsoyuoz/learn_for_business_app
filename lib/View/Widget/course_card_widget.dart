import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_for_business_app/Model/dummy_course.dart';
import 'package:learn_for_business_app/View/Page/Course/course_detail_page.dart';

class CourseItemCardWidget extends StatelessWidget {
  const CourseItemCardWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  final Course data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) => CourseDetailPage(data: data),));
        },
        child: Material(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Image.asset(
                      data.photoUrl,
                      fit: BoxFit.cover,
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Center(
                        child: Text(
                          data.title,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}