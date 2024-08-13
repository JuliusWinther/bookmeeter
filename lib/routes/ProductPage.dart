import 'dart:ui';

import 'package:bookmeeter/routes.dart';
import 'package:bookmeeter/widgets/AppSpecific/BookPreview.dart';
import 'package:bookmeeter/widgets/AppSpecific/HorizontalSlider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Widget> images = [
    Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Transform.scale(
            scale: 1.3,
            child: BookPreview(
              cleanVersion: true,
            ),
          ),
        ),
      ),
    ),
    Image.network(
      "https://i.pinimg.com/originals/43/03/a8/4303a88079c12e903a40168d6f00420c.jpg",
      fit: BoxFit.scaleDown,
    ),
    Image.network(
      "https://i.pinimg.com/originals/12/c4/cb/12c4cb7309964ccd6ac8179749851141.jpg",
      fit: BoxFit.cover,
    ),
  ];

  int activePage = 0;

  bool bookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 242, 243, 244),
          backgroundColor: const Color.fromARGB(255, 242, 243, 244)),
      child: (Scaffold(
        extendBody: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 242, 243, 244),
          surfaceTintColor: const Color.fromARGB(255, 242, 243, 244),
          automaticallyImplyLeading: false,
          toolbarHeight: 60,
          leadingWidth: MediaQuery.of(context).size.width,
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Color.fromARGB(255, 242, 243, 244),

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => {Navigator.of(context).pop()},
                  child: const Padding(
                    padding: EdgeInsets.only(left: 7.0),
                    child: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Color.fromARGB(255, 140, 140, 140),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "Book Title",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 7.0),
                  child: Icon(
                    Icons.share_rounded,
                    color: Color.fromARGB(255, 154, 157, 161),
                  ),
                ),
              ]),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(children: [
                  SizedBox(
                    height: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: PageView.builder(
                          itemCount: images.length,
                          pageSnapping: true,
                          onPageChanged: (page) {
                            setState(() {
                              activePage = page;
                            });
                          },
                          itemBuilder: (context, pagePosition) {
                            return images[pagePosition];
                          }),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: indicators(images.length, activePage)),
                  )
                ]),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  margin: const EdgeInsets.only(top: 10),
                  //width: 95,
                  //height: 150,
                  //width: MediaQuery.of(context).size.width * 0.23,
                  //height: MediaQuery.of(context).size.height * 0.25,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30.0, left: 25, right: 25),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "€20.00",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    height: 1.6,
                                    fontSize: 22,
                                    color: const Color.fromARGB(
                                        255, 115, 169, 163)),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Titolo del Libro",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                            fontSize: 24,
                                            color: Colors.black87),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "Editore",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                            color: const Color.fromARGB(
                                                255, 182, 182, 182)),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              ClipOval(
                                child: Material(
                                  color: bookmarked
                                      ? const Color.fromARGB(255, 69, 174, 159)
                                      : const Color.fromARGB(255, 251, 117, 73),
                                  child: InkWell(
                                    splashColor: bookmarked
                                        ? const Color.fromARGB(
                                            255, 251, 117, 73)
                                        : const Color.fromARGB(
                                            255, 69, 174, 159),
                                    onTap: () {
                                      SystemSound.play(SystemSoundType.click);
                                      setState(() {
                                        bookmarked = !bookmarked;
                                      });
                                    },
                                    child: SizedBox(
                                        width: 45,
                                        height: 45,
                                        child: Icon(bookmarked
                                            ? Icons.bookmark_remove_rounded
                                            : Icons.bookmark_add_outlined)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: MediaQuery.of(context).size.width,
                                maxWidth: MediaQuery.of(context).size.width,
                                maxHeight: 160,
                              ),
                              child: const Text(
                                //280 caratteri
                                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat mas",
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 90,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(25, 167, 167, 167),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 55,
                                            height: 55,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2.5),
                                              /*boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black,
                                                    offset: Offset(
                                                        /*dx*/ 4, /*dy*/ 4),
                                                    spreadRadius: -7,
                                                    blurRadius: 13.0),
                                              ],*/
                                              image: const DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    'assets/testing/images/profile-image.jpg'),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  "Venduto da",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  "Nome Utente",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.forum_rounded,
                                        size: 26,
                                        color: Colors.black54,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        /*bottomSheet: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 17, 171, 205),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => {},
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Aggiungi al Carrello",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),*/
      )),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        width: 5,
        height: 5,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black38,
            shape: BoxShape.circle),
      );
    });
  }
}
