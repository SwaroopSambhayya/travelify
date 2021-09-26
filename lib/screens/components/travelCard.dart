import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:travelify/screens/components/circleAvatar.dart';
import 'package:travelify/screens/place.dart';

class TravelCard extends StatelessWidget {
  final String index;
  TravelCard({this.index});
  @override
  Widget build(BuildContext context) {
    double count = 0;
    List profilePics = ["girl", "girl2", "man"];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceDetails(index: index),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(13),
        margin: EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(0.05),
              )
            ],
            color: Theme.of(context).primaryColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: Offset(0, 12),
                      color: Colors.black.withOpacity(0.1),
                    ),
                    BoxShadow(
                      blurRadius: 20,
                      offset: Offset(0, 10),
                      color: Colors.black.withOpacity(0.1),
                    )
                  ]),
                  child: Hero(
                    tag: index,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        "images/monastory.jpg",
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.25),
                    child: IconButton(
                      icon: Icon(
                        IconlyBold.heart,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 15, bottom: 5),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Paro Taktsang",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        ...profilePics.map((e) {
                          return CircleProfile(
                            imageUrl: e,
                            margin: count += 15,
                          );
                        }),
                        Positioned(
                          left: 65,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 2.5),
                            ),
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.grey[200],
                              child: Text(
                                "+15",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 5, top: 5),
              child: Row(
                children: [
                  Icon(
                    IconlyBold.location,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Taktsange trail, Bhutan",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
