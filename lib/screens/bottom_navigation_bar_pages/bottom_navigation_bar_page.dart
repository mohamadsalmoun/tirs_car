import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tirs_car/screens/bottom_navigation_bar_pages/personal_page.dart';
import 'package:tirs_car/screens/bottom_navigation_bar_pages/sections_page.dart';
import 'package:tirs_car/utils/common.dart';
import 'home_page.dart';
import 'cart_page.dart';



class BottomNavigationBarPage extends StatefulWidget {

  @override
  _BottomNavigationBarPageState createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {

  final _pageController = PageController(initialPage: 0);
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(

          height: 75,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 0.5,
                    offset: Offset(2, 0)),
              ]),
          child: Stack(children: [
            CurvedNavigationBar(
              animationCurve: Curves.easeInOutSine,
              color: Colors.white,
              index: _page,
              animationDuration: Duration(milliseconds: 200),
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: backgroundColor,
              items: <Widget>[
                Container(
                    width: 35,
                    height: 35,
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.home_outlined,color: _page != 0 ? Color(0xff484848) : Color(0xFFE02B20),)),
                Container(
                    width: 35,
                    height: 35,
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.shopping_cart_outlined,color: _page != 1 ? Color(0xff484848) : Color(0xFFE02B20),)),
                Container(
                    width: 35,
                    height: 35,
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.widgets_rounded,color: _page != 2 ? Color(0xff484848) : Color(0xFFE02B20),)

                ),
                Container(
                    width: 35,
                    height: 35,
                    padding: EdgeInsets.all(5),
                    child: Icon(Icons.perm_identity,color: _page != 3 ? Color(0xff484848) : Color(0xFFE02B20),)
                ),


              ],
              onTap: (index) {
                setState(() {
                  _page = index;
                  _pageController.jumpToPage(index);
                });
              },
            ),
          ]),
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomePage(),
            CartPage(),
            SectionsPage(),
            PersonalPage(),
          ],
         onPageChanged: (index){
           _pageController.jumpToPage(_page);
         },
        ));
  }


}