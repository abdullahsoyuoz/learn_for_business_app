import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_for_business_app/Controller/utility.dart';
import 'package:learn_for_business_app/View/Widget/customappbar.dart';

class FrequentlyAskedQuestionPage extends StatelessWidget {
  const FrequentlyAskedQuestionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(context, "Sıkça Sorulan Sorular"),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 95,
                width: context.width,
                child: ColoredBox(
                  color: Colors.grey.shade200,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Başlıca Sorular',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: 10,
                itemBuilder: (_, index) {
                  return FaqItemWidget();
                },
                separatorBuilder: (_, i) => const Divider(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FaqItemWidget extends StatelessWidget {
  FaqItemWidget({
    Key key,
  }) : super(key: key);

  final ValueNotifier<bool> isExtend = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isExtend,
        builder: (context, value, _) {
          return GestureDetector(
            onTap: () {
              isExtend.value = !value;
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0, top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                          child: Text(
                              'Numarasını takip ettiğim biri gerçek zamanlı bir şekilde bana rapor verebilir mi?')),
                      AnimatedRotation(
                        turns: value ? 0.25 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: const FaIcon(
                          FontAwesomeIcons.chevronRight,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                  AnimatedCrossFade(
                    alignment: Alignment.bottomCenter,
                      firstChild: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(Faker()
                            .lorem
                            .sentences(3)
                            .toString()
                            .replaceAll('[', '')
                            .replaceAll(']', '')),
                      ),
                      secondChild: const SizedBox(),
                      crossFadeState: value
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 300)),
                ],
              ),
            ),
          );
        });
  }
}
