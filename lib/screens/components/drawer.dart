import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelify/theme.dart';

class MyDrawer extends StatefulWidget {
  final Widget scaffold;
  final GlobalKey<InnerDrawerState> innerDrawerKey;

  MyDrawer({this.scaffold, this.innerDrawerKey});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String name = '';
  @override
  void initState() {
    initName();
    super.initState();
  }

  initName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      name = pref.getString("name");
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = Provider.of<ThemeProvider>(context).themeMode;
    return InnerDrawer(
      key: widget.innerDrawerKey,
      scaffold: widget.scaffold,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 20,
          offset: Offset(-5, 10),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 20,
          offset: Offset(10, 0),
        )
      ],
      onTapClose: true, // default false
      swipe: false, // default true
      colorTransitionChild: Colors.white, // default Color.black54
      colorTransitionScaffold: Colors.transparent, // default Color.black54

      //When setting the vertical offset, be sure to use only top or bottom
      offset: IDOffset.only(bottom: 0.05, right: 0, left: 0.3),

      scale: IDOffset.horizontal(0.8), // set the offset in both directions

      proportionalChildArea: true, // default true
      borderRadius: 40, // default 0
      leftAnimationType: InnerDrawerAnimation.static, // default static
      rightAnimationType: InnerDrawerAnimation.quadratic,
      backgroundDecoration: BoxDecoration(
          color: Theme.of(context)
              .cardColor), // default  Theme.of(context).backgroundColor

      //when a pointer that is in contact with the screen and moves to the right or left
      onDragUpdate: (double val, InnerDrawerDirection direction) {
        // return values between 1 and 0

        // check if the swipe is to the right or to the left
        //print(direction == InnerDrawerDirection.start);
      },

      // innerDrawerCallback: (a) =>
      //     print(a), // return  true (open) or false (close)
      leftChild: Material(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          color: themeMode == ThemeMode.dark
                              ? Colors.black
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 20)
                          ]),
                      child: IconButton(
                        iconSize: 20,
                        icon: Icon(
                          Icons.close,
                          size: 20,
                        ),
                        onPressed: () {
                          widget.innerDrawerKey.currentState.toggle();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Hi " + "Swaroop" + ",",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTileTheme(
                    iconColor: Theme.of(context).iconTheme.color,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ListTile(
                        //   contentPadding: EdgeInsets.all(0),
                        //   leading: Icon(
                        //     MyIcon.notification,
                        //   ),
                        //   title: Text(
                        //     "Notifications",
                        //     style:
                        //         TextStyle(fontFamily: "Poppins", fontSize: 14),
                        //   ),
                        // ),
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(
                            Icons.palette_rounded,
                          ),
                          title: Row(
                            children: [
                              Text(
                                "Dark Mode",
                                style: TextStyle(
                                    fontFamily: "Poppins", fontSize: 14),
                              ),
                              Switch.adaptive(
                                  activeColor: Theme.of(context).accentColor,
                                  value: Provider.of<ThemeProvider>(context)
                                              .themeMode ==
                                          ThemeMode.dark
                                      ? true
                                      : false,
                                  onChanged: (value) {
                                    Provider.of<ThemeProvider>(context,
                                            listen: false)
                                        .toggleTheme(value);
                                  })
                            ],
                          ),
                        ),

                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(
                            Icons.logout,
                          ),
                          onTap: () async {
                            // widget.isLoggedIn.value = false;
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.setBool("isLoggedIn", false);
                          },
                          title: Row(
                            children: [
                              Text(
                                "Sign out",
                                style: TextStyle(
                                    fontFamily: "Poppins", fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
