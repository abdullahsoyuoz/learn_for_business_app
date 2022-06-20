import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_for_business_app/Controller/extension.dart';
import 'package:learn_for_business_app/Model/Const/pricing.dart';
import 'package:learn_for_business_app/View/Page/Pricing/View/business_view.dart';
import 'package:learn_for_business_app/View/Page/Pricing/View/free_view.dart';
import 'package:learn_for_business_app/View/Page/Pricing/View/lifetime_view.dart';
import 'package:learn_for_business_app/View/Page/Pricing/View/pro_view.dart';
import 'package:learn_for_business_app/View/Style/color.dart';

class PricingPage extends StatefulWidget {
  const PricingPage({Key key}) : super(key: key);

  @override
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage>
    with SingleTickerProviderStateMixin {
  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  TabController tabController;

  final List<Widget> _views = const [
    FreeView(),
    ProView(),
    LifetimeView(),
    BusinessView(),
  ];

  final List<Widget> _tabs = pricingList.map((e) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: FittedBox(
          child: Text(
            e.tabTitle,
            style: GoogleFonts.montserrat(color: Colors.black),
          ),
        ));
  }).toList();

  @override
  void initState() {
    tabController = TabController(length: _views.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = pricingList[tabController.index];
    return SizedBox.expand(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          children: [
            TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 5,
                indicatorColor: AppColor.green,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                padding: const EdgeInsets.only(top: 20),
                onTap: (i) {
                  setState(() {});
                },
                tabs: _tabs),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: 70,
                  width: context.width,
                  child: ColoredBox(
                    color: AppColor.greenLight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.title,
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              color: AppColor.greenDark,
                            ),
                          ),
                          Container(
                            child: data.fee == null
                                ? const SizedBox()
                                : Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      data.fee == 0
                                          ? 'Ücretsiz'
                                          : '${data.fee} TL',
                                      style: GoogleFonts.montserrat(
                                        color: AppColor.greenDark,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.asset(
                    data.icon,
                    width: context.width * 0.4,
                  ),
                )),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  separatorBuilder: (c, i) => const Divider(),
                  itemCount: data.pricingContents.length,
                  itemBuilder: (c, index) {
                    final dataContent = data.pricingContents[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.check,
                            color: AppColor.greenDark,
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(dataContent),
                          ))
                        ],
                      ),
                    );
                  },
                ),
                data.id == 3
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: SizedBox(
                              height: 70,
                              width: context.width,
                              child: ColoredBox(
                                color: AppColor.greenLight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Fiyatlandırma',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          color: AppColor.greenDark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 20, right: 20),
                            child: Text(
                              'Kurumsal üyelikte eğitim alacak olanlar şirket e-mail adresiyle kayıt olmalıdır.',
                              style:
                                  GoogleFonts.montserrat(color: Colors.black),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            itemCount: businessPlanList.length,
                            itemBuilder: (context, i) {
                              final businessPricingItem = businessPlanList[i];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Card(
                                  elevation: 0,
                                  color: Colors.grey.shade200,
                                  margin: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          businessPricingItem.icon,
                                          height: 50,
                                        ),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              businessPricingItem.title,
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600),
                                            )),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 3),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                "${businessPricingItem.pricing} TL + KDV",
                                                style: GoogleFonts.montserrat(
                                                  color: AppColor.greenDark,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      )
                    : const SizedBox(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        height: 70,
                        width: context.width,
                        child: ColoredBox(
                          color: AppColor.greenLight,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Eğitimler',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    color: AppColor.greenDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: const [
                          Flexible(
                            flex: 1,
                            child: Center(child: Text('ID')),
                          ),
                          Flexible(
                            flex: 5,
                            child: Text('Eğitim adı'),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: 10.0),
                      itemCount: trainingList.length,
                      itemBuilder: (c, index) {
                        final dataTraing = trainingList[index];
                        return ColoredBox(
                          color: index % 2 == 0
                              ? Colors.grey.shade200
                              : Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Center(
                                      child: Text(dataTraing.id.toString())),
                                ),
                                Flexible(
                                  flex: 5,
                                  child: Text(dataTraing.title),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
