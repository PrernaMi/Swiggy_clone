import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:swiggy_clone/user_loaction/location.dart';

class HomePage extends StatelessWidget {
  MediaQueryData? mqData;
  List<String> mBanner = [
    "assets/food_banner/img.png",
    "assets/food_banner/img_1.png",
    "assets/food_banner/img_2.png",
    "assets/food_banner/img_3.png",
  ];
  List<Map<String, dynamic>> mDishes = [
    {'img': "assets/dishes/img.png", 'name': "Pure veg"},
    {'img': "assets/dishes/img_1.png", 'name': "Chole Bhature"},
    {'img': "assets/dishes/img_2.png", 'name': "Dosa"},
    {'img': "assets/dishes/img_3.png", 'name': "Samosa"},
    {'img': "assets/dishes/img_4.png", 'name': "Kachori"},
    {'img': "assets/dishes/img_5.png", 'name': "Paratha"},
    {'img': "assets/dishes/img_6.png", 'name': "Cakes"},
    {'img': "assets/dishes/img_7.png", 'name': "Biryani"},
    {'img': "assets/dishes/img_8.png", 'name': "Biryani"},
    {'img': "assets/dishes/img_9.png", 'name': "Pav Bhaji"},
  ];

  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          overlayColor: WidgetStateColor.transparent,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LocationPage();
            }));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              Text(
                "Loni",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(
              Icons.account_circle,
              size: 30,
            ),
          )
        ],
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: mqData!.size.height * 0.4,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: LayoutBuilder(builder: (_, cons) {
                  return Column(
                    children: [
                      Container(
                        height: cons.maxHeight * 0.16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: SizedBox(
                                  width: cons.maxWidth,
                                ),
                              ),
                              Icon(Icons.search),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.settings_voice,
                                color: Colors.red,
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: cons.maxHeight * 0.5,
                            child: Column(
                              children: [
                                Flexible(
                                    fit: FlexFit.loose,
                                    child: Image.asset(
                                      "assets/images__1_-removebg-preview.png",
                                      height: cons.maxHeight * 0.6,
                                    )),
                                Container(
                                  height: cons.maxHeight * 0.13,
                                  width: cons.maxWidth * 0.33,
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.systemYellow,
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Order Now..",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(Icons.arrow_forward_outlined)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                              fit: FlexFit.loose,
                              child: Image.asset(
                                "assets/banner.png",
                                height: cons.maxHeight * 0.6,
                                width: cons.maxWidth * 0.6,
                              )),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(
              height: mqData!.size.height * 0.2,
              width: mqData!.size.width,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: mBanner.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: mqData!.size.height * 0.2,
                          width: mqData!.size.width * 0.9,
                          child: Image.asset(
                            mBanner[index],
                            fit: BoxFit.fitWidth,
                          ),
                        )),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "WHAT'S ON YOUR MIND?",
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 2,
                      width: mqData!.size.width * 0.9,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey.shade200))),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: mqData!.size.height * 0.4,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: mDishes.length,
                  itemBuilder: (_, cIndex) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: CircleAvatar(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                mDishes[cIndex]['img'],
                                fit: BoxFit.fill,
                              ),
                            )),
                          ),
                          Text(mDishes[cIndex]['name'])
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
