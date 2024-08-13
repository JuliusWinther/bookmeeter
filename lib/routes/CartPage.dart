import 'package:bookmeeter/routes.dart';
import 'package:bookmeeter/widgets/AppSpecific/CustomAppBar.dart';
import 'package:bookmeeter/widgets/AppSpecific/HorizontalSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final int _selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      extendBody: true,
      appBar: AppBar(
        //backgroundColor: Colors.white,
        //foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        leadingWidth: MediaQuery.of(context).size.width,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        title: CustomAppBar(),
      ),
      body: ListView(
        children: [],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromARGB(
              255, 17, 171, 205), //const Color.fromARGB(255, 249, 120, 75),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            enableFeedback: false,
            selectedItemColor: Colors
                .white, //const Color.fromARGB(255, 249, 120, 75), //Colors.black87,
            unselectedItemColor: Colors.black45,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  activeIcon: Icon(FontAwesomeIcons.house),
                  icon: Icon(FontAwesomeIcons.house),
                  label: ""),
              BottomNavigationBarItem(
                  activeIcon: Icon(FontAwesomeIcons.magnifyingGlass),
                  icon: Icon(FontAwesomeIcons.magnifyingGlass),
                  label: ""),
              BottomNavigationBarItem(
                  activeIcon: Icon(FontAwesomeIcons.solidSquarePlus),
                  icon: Icon(FontAwesomeIcons.squarePlus),
                  label: ""),
              BottomNavigationBarItem(
                  activeIcon: Icon(FontAwesomeIcons.solidBookmark),
                  icon: Icon(FontAwesomeIcons.solidBookmark),
                  label: ""),
              BottomNavigationBarItem(
                  activeIcon: Icon(FontAwesomeIcons.boxOpen),
                  icon: Icon(FontAwesomeIcons.boxOpen),
                  label: ""),
            ],
            currentIndex: _selectedIndex,
            onTap: (value) {
              if (value == 0) {
                Navigator.of(context)
                    .pushReplacementNamed(RouteGenerator.homePage);
              } else if (value == 1) {
                Navigator.of(context)
                    .pushReplacementNamed(RouteGenerator.searchPage);
              } else if (value == 3) {
                Navigator.of(context)
                    .pushReplacementNamed(RouteGenerator.bookmarkPage);
              }
            },
          ),
        ),
      ),
    ));
  }
}
