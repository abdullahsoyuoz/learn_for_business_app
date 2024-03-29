import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/constant_texts.dart';
import 'package:learn_for_business_app/Controller/mainpage_indexer.dart';
import 'package:learn_for_business_app/Model/dummy_course.dart';
import 'package:learn_for_business_app/View/Style/color.dart';
import 'package:learn_for_business_app/View/View/mainpageview.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';
import 'package:learn_for_business_app/View/Widget/dialog_widget.dart';
import 'package:provider/provider.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        appBar: customAppBar(context, 'Sınav'),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          padding: const EdgeInsets.only(bottom: 240),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(),
                itemCount: exams.length,
                itemBuilder: (context, index) {
                  final data = exams[index];
                  return QuestionItem(data: data, index: index);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialog(
                              isTransparent: false,
                              callback: () {
                                Provider.of<MainPageIndexer>(context,
                                        listen: false)
                                    .setIndex(0)
                                    .whenComplete(() {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => MainPageView(),
                                      ),
                                      (route) => false).whenComplete(() {});
                                });
                              },
                              title: 'Tebrikler',
                              description: examfinishDescirpiton,
                              buttonTitle: 'Anasayfaya Dön',
                            );
                          });
                    },
                    child: const Text('Gönder')),
              )
            ],
          ),
        ));
  }
}

class QuestionItem extends StatefulWidget {
  const QuestionItem({Key key, this.data, this.index}) : super(key: key);
  final Exam data;
  final int index;

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  int selectedAnswer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (widget.index + 1).toString(),
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    widget.data.question,
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                  ),
                )),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: widget.data.answers.length,
            itemBuilder: (context, index2) {
              final answer = widget.data.answers[widget.index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    Radio(
                        value: index2,
                        groupValue: selectedAnswer,
                        fillColor:
                            MaterialStateProperty.all(AppColor.greenDark),
                        activeColor: AppColor.greenDark,
                        onChanged: (i) {
                          setState(() {
                            selectedAnswer = i;
                          });
                        }),
                    Expanded(child: Text(answer)),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
