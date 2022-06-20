import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/extension.dart';
import 'package:learn_for_business_app/Model/dummy_course.dart';
import 'package:learn_for_business_app/Model/fake_user.dart';
import 'package:learn_for_business_app/View/Style/color.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CourseCommentsPage extends StatelessWidget {
  const CourseCommentsPage({Key key, this.data}) : super(key: key);
  final Course data;

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(context, 'Yorumlar'),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        padding:
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 120),
        itemCount: data.comments.length,
        itemBuilder: (context, index) {
          final comment = data.comments[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Material(
              color: AppColor.greenLight,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                                backgroundImage: AssetImage(user.photoUrl)),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(user.name, style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 16)),
                                  SmoothStarRating(
                                    color: AppColor.greenDark,
                                    borderColor: AppColor.greenDark,
                                    rating: Random().nextDouble() * 5,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          comment.publishDate.toStringFormat,
                          style: GoogleFonts.montserrat(
                              color: AppColor.greenDark,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(comment.content, style: GoogleFonts.montserrat(fontSize: 13),),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
