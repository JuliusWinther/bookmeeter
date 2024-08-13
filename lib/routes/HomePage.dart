import 'package:bookmeeter/routes.dart';
import 'package:bookmeeter/widgets/AppSpecific/CustomAppBar.dart';
import 'package:bookmeeter/widgets/AppSpecific/HorizontalSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedIndex = 0;

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
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          title: CustomAppBar()),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 35.0, vertical: 25.0),
            child: Stack(children: [
              /*Transform.translate(
                offset: const Offset(5, 6),
                child: TextFormField(
                  enabled: true,
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 247, 192,
                        17), //const Color.fromARGB(55, 167, 167, 167),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(35 /*8*/)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(35 /*8*/)),
                  ),
                ),
              ),*/
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  isCollapsed: true,
                  filled: true,
                  fillColor: const Color.fromARGB(25, 167, 167, 167),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(/*35*/ 8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(/*35*/ 8)),
                  labelText: 'Cerca',
                  labelStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.black54,
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: HorizontalSlider(
              title: "Vetrina",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: HorizontalSlider(
              title: "Consigliati per te",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: HorizontalSlider(
              title: "Ultimi Annunci",
            ),
          ),
        ],
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
              if (value == 1) {
                Navigator.of(context)
                    .pushReplacementNamed(RouteGenerator.searchPage);
              } else if (value == 3) {
                Navigator.of(context)
                    .pushReplacementNamed(RouteGenerator.bookmarkPage);
              } else if (value == 4) {
                Navigator.of(context)
                    .pushReplacementNamed(RouteGenerator.cartPage);
              }
            },
          ),
        ),
      ),
    ));
  }
}
