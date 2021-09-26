import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:travelify/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends PreferredSize {
  final GlobalKey<InnerDrawerState> innerDrawerKey;
  final bool autoImplyLeading;
  MyAppBar({this.innerDrawerKey, this.autoImplyLeading = false});

  @override
  Size get preferredSize => Size.fromHeight(70);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: autoImplyLeading
                ? null
                : () {
                    innerDrawerKey.currentState.toggle();
                  },
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: autoImplyLeading
                      ? Colors.black.withOpacity(0.4)
                      : Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, -3))
                  ]),
              child: Container(
                alignment: Alignment.center,
                child: autoImplyLeading
                    ? InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    : SvgPicture.asset(
                        Provider.of<ThemeProvider>(context).themeMode ==
                                ThemeMode.dark
                            ? 'images/menu2.svg'
                            : 'images/menu.svg',
                        height: 15,
                        width: 15,
                      ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10, top: 10),
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: autoImplyLeading
                    ? Colors.black.withOpacity(0.4)
                    : Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: Offset(0, -3))
                ]),
            child: Stack(
              children: [
                autoImplyLeading
                    ? IconButton(
                        icon: Icon(
                          IconlyBold.heart,
                          color: Colors.white,
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                      )
                    : IconButton(
                        icon: Icon(IconlyLight.notification), onPressed: () {}),
                if (!autoImplyLeading)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Theme.of(context).accentColor,
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
