import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:travelify/screens/components/appBar.dart';
import 'package:travelify/theme.dart';

class PlaceDetails extends StatelessWidget {
  final String index;
  PlaceDetails({this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onPressed: () {},
          isExtended: true,
          mini: false,
          backgroundColor: Colors.black,
          child: Text(
            "Book Now",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 15,
                        offset: Offset(0, 12),
                      )
                    ]),
                    child: Hero(
                      tag: index,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          "images/monastory.jpg",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.6,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 13,
                    right: 13,
                    child: MyAppBar(
                      autoImplyLeading: true,
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Paro Taktsang",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$148",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                            Text(
                              "/person",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: (MediaQuery.of(context).size.height * 0.6) * 0.5,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.6), width: 3),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://media.tacdn.com/media/attractions-splice-spp-674x446/06/74/ae/c0.jpg",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: (MediaQuery.of(context).size.height * 0.6) * 0.62,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.6), width: 3),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://cdn.drukasia.com/content/images/media/DrukAsia_112117_druk-asia-bhutan-travel-specialist-tiger-nest-monastery-article-2017-zahariz.jpg",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: (MediaQuery.of(context).size.height * 0.6) * 0.74,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.6), width: 3),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://cdn.drukasia.com/content/images/media/DrukAsia_112117_druk-asia-bhutan-travel-specialist-tiger-nest-monastery-article-2017-zahariz.jpg",
                          ),
                        ),
                      ),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Center(
                          child: Text(
                            "12+",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomListTile(
                        title: "625 KM",
                        subtitle: "Distance",
                        iconData: IconlyBold.timeCircle,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomListTile(
                        title: "4.6",
                        subtitle: "Ratings",
                        iconData: IconlyBold.star,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.all(10).copyWith(left: 20),
                child: Text(
                  "Paro Taktsang, is a sacred Vajrayana Himalayan Buddhist site located in the cliffside of the upper Paro valley in Bhutan. It is one of thirteen Tiger's Nest caves in historical Tibet in which Padmasambhava practiced and taught Vajrayana.",
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  CustomListTile({this.title, this.subtitle, this.iconData});
  final String title;
  final String subtitle;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)
            ]),
        child: Icon(
          iconData,
          size: 30,
          color: Theme.of(context).accentColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitle),
    );
  }
}
