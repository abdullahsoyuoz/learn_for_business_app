import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_for_business_app/Controller/asset_constants.dart';
import 'package:learn_for_business_app/Controller/utility.dart';
import 'package:learn_for_business_app/Model/Const/profile_item.dart';
import 'package:learn_for_business_app/Model/fake_user.dart';
import 'package:learn_for_business_app/View/Page/Profile/profile_edit_page.dart';
import 'package:learn_for_business_app/View/Style/color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: SizedBox.expand(
          child: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 120),
            child: Column(
              children: [
                SizedBox(
                  width: context.width,
                  height: 95,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                user.name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Yazılımcı',
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => ProfileEditPage(),
                                )),
                            child: Card(
                              margin: EdgeInsets.zero,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Image.asset(
                                AppConstants.pen,
                                color: AppColor.green,
                                width: 25,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: profileMenuItems.length,
                  itemBuilder: (c, index) {
                    final data = profileMenuItems[index];
                    return ProfileItemWidget(data: data);
                  },
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Çıkış Yap')),
            ),
          )
        ],
      )),
    );
  }
}

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  final ProfileMenuItem data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 70,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(10),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            // overlayColor: MaterialStateProperty.all(Colors.red)
          ),
          onPressed: () => profileItemRouteHelper(context,data.id),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(children: [
                    Image.asset(data.icon,
                        width: 30, color: AppColor.greenDark),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(data.title, style: const TextStyle(color: Colors.black),),
                    )
                  ]),
                ),
                const FaIcon(FontAwesomeIcons.chevronRight, size: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
