import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:travelify/screens/components/appBar.dart';
import 'package:travelify/screens/components/circleAvatar.dart';
import 'package:travelify/screens/components/drawer.dart';
import 'package:travelify/screens/components/travelCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  List categories = [
    {
      "src":
          "https://images.unsplash.com/photo-1509804041229-d0e9abbf44ea?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1953&q=80",
      "name": "Sky Tour"
    },
    {
      "src":
          "https://images.unsplash.com/photo-1486314030120-d5ab85fe58cd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1055&q=80",
      "name": "Desert"
    },
    {
      "src":
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1053&q=80",
      "name": "Beaches"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MyDrawer(
      innerDrawerKey: _innerDrawerKey,
      scaffold: Scaffold(
        appBar: MyAppBar(
          innerDrawerKey: _innerDrawerKey,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explore the",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Beautiful World!",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputField(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.10),
                                    blurRadius: 15,
                                    offset: Offset(0, 5),
                                  ),
                                ]),
                            child: IconButton(
                                icon: Icon(
                                  IconlyBold.filter,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                onPressed: () {}),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w300),
                      ),
                      Categories(categories: categories),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Travel Places",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w300),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[200],
                                shape: StadiumBorder(),
                                elevation: 0),
                            onPressed: () {},
                            child: Text(
                              "View All",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return TravelCard(index: index.toString());
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    Key key,
    @required this.categories,
  }) : super(key: key);

  final List categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 120,
        child: Row(children: [
          ...categories.map(
            (ele) => Category(
              src: ele["src"],
              title: ele["name"],
            ),
          ),
        ]),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String src;
  final String title;
  Category({this.src, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 25, left: 10),
      margin: EdgeInsets.only(left: 5, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 25,
              color: Colors.black.withOpacity(0.04),
            )
          ],
          color: Theme.of(context).primaryColor),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(src, fit: BoxFit.cover, width: 50, height: 60),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(13), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.02),
          blurRadius: 25,
          offset: Offset(0, 0),
        ),
      ]),
      child: TextField(
        style: TextStyle(fontFamily: "Poppins"),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.white,
          hintText: "Search",
          hintStyle: TextStyle(fontFamily: "Poppins", color: Colors.grey[350]),
          prefixIcon: Icon(
            IconlyLight.search,
            color: Colors.black,
            size: 18,
          ),
        ),
      ),
    );
  }
}
