import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/extension.dart';
import 'package:learn_for_business_app/Model/dummy_course.dart';
import 'package:learn_for_business_app/Model/fake_user.dart';
import 'package:learn_for_business_app/View/Page/Course/course_comment_page.dart';
import 'package:learn_for_business_app/View/Page/Course/course_payment_page.dart';
import 'package:learn_for_business_app/View/Style/color.dart';
import 'package:learn_for_business_app/View/Widget/course_card_widget.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({Key key, this.data}) : super(key: key);
  final Course data;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  final ValueNotifier<bool> hasAuth = ValueNotifier(false);
  double rank;

  @override
  void initState() {
    rank = widget.data.rank;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
    widget.data.toString();
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(context, 'Kurs Detayı'),
      body: SizedBox.expand(
          child: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            padding: const EdgeInsets.only(top: 30, bottom: 240),
            child: buildContent(),
          ),
          buildBottomAuth(context)
        ],
      )),
    );
  }

  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Text(
                widget.data.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(widget.data.photoUrl),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kategori',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600),
                    ),
                    Expanded(
                        child: Text(
                      widget.data.category,
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade900),
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
                      'Hazırlayan',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600),
                    ),
                    Expanded(
                        child: Text(
                      user.name,
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade900),
                      textAlign: TextAlign.end,
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => CourseCommentsPage(
                    data: widget.data,
                  ),
                )),
            child: Container(
              height: 70,
              color: AppColor.greenLight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.commentDots,
                            size: 20,
                            color: AppColor.greenDark,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Yorumlar',
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.greenDark),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              '( ${widget.data.comments.length} )',
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.greenDark),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SmoothStarRating(
                            color: AppColor.greenDark,
                            borderColor: AppColor.greenDark,
                            rating: rank,
                            onRated: (val) {
                              setState(() {
                                rank = val;
                              });
                            },
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: FaIcon(FontAwesomeIcons.chevronRight,
                                size: 20, color: AppColor.greenDark),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'Açıklama',
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Text(
            widget.data.description,
            style: GoogleFonts.montserrat(),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.data.descriptionItems.length,
              itemBuilder: (context, index) {
                final data = widget.data.descriptionItems[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidCircle,
                        color: AppColor.green,
                        size: 15,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          data,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800),
                        ),
                      ))
                    ],
                  ),
                );
              },
            )),
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            height: 70,
            width: context.width,
            color: AppColor.greenLight,
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Eğitim içeriği',
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.greenDark),
                )),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.data.descriptionItems.length,
              itemBuilder: (context, index) {
                final data = widget.data.contents[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidCircle,
                        color: AppColor.green,
                        size: 15,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          data,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800),
                        ),
                      ))
                    ],
                  ),
                );
              },
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Text(
            'Son Eklenenler',
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 230,
          width: context.width,
          child: ListView.builder(
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 40),
            itemCount: myCourseList.length,
            itemBuilder: (context, index) {
              final data = myCourseList[index];
              return Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: AspectRatio(
                    aspectRatio: 0.7,
                    child: CourseItemCardWidget(data: data.course)),
              );
            },
          ),
        )
      ],
    );
  }

  Widget buildBottomAuth(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ValueListenableBuilder(
          valueListenable: hasAuth,
          builder: (context, value, _) {
            return Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 20,
                  bottom: 20,
                ),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: value
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => const CoursePaymentPage(),));
                    }, child: const Text('Satın Al'))
                  ),
                  secondChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Bu eğitimi alabilmek için'),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      hasAuth.value = !value;
                                    },
                                    child: const Text('Giriş Yap'))),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () {
                                      hasAuth.value = !value;
                                    },
                                    child: const Text('Kayıt Ol'))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
