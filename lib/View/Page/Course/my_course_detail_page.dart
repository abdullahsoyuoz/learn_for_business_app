import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Model/dummy_course.dart';
import 'package:learn_for_business_app/View/Style/color.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class MyCourseDetailPage extends StatefulWidget {
  const MyCourseDetailPage({Key key, this.data}) : super(key: key);
  final MyCourse data;

  @override
  State<MyCourseDetailPage> createState() => _MyCourseDetailPageState();
}

class _MyCourseDetailPageState extends State<MyCourseDetailPage> {
  // VideoPlayerController _controller;
  // CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //   'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    // )..initialize().then((_) {
    //     setState(() {});
    //   });
    // _customVideoPlayerController = CustomVideoPlayerController(
    //   context: context,
    //   videoPlayerController: _controller,
    // );
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(context, 'Derslerim'),
      body: SizedBox.expand(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AspectRatio(
              aspectRatio: 16 / 9,
              child: Placeholder(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Text(
                widget.data.course.title,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'Kurstaki konumunuz',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: LinearProgressBar(
                      currentStep: 76,
                      maxSteps: 100,
                      progressType: LinearProgressBar
                          .progressTypeLinear, // Use Linear progress
                      progressColor: AppColor.greenDark,
                      backgroundColor: AppColor.greenLight,
                      minHeight: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                  top: 30, left: 20, right: 20, bottom: 120),
              itemCount: widget.data.course.contents.length,
              itemBuilder: (_, index) {
                final content = widget.data.course.contents[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Material(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                  content,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )),
                                const FaIcon(FontAwesomeIcons.chevronRight,
                                    color: Colors.grey, size: 20)
                              ],
                            ),
                            const Divider(
                              height: 20,
                            ),
                            const Text('14 dk'),
                          ],
                        ),
                      )),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
