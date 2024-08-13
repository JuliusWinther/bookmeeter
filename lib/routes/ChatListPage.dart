import 'dart:ui';

import 'package:bookmeeter/routes.dart';
import 'package:bookmeeter/widgets/AppSpecific/BookPreview.dart';
import 'package:bookmeeter/widgets/AppSpecific/ChatSelector.dart';
import 'package:bookmeeter/widgets/AppSpecific/HorizontalSlider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  int activePage = 0;

  bool bookmarked = false;

  @override
  Widget build(BuildContext context) {
    return (Theme(
        data: Theme.of(context).copyWith(
          scaffoldBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        child: Scaffold(
            extendBody: true,
            appBar: AppBar(
              centerTitle: true,
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              toolbarHeight: 60,
              leadingWidth: MediaQuery.of(context).size.width,
              systemOverlayStyle: const SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: Colors.white,

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
                          color: Color.fromARGB(255, 159, 159, 160),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Elenco Chat",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 7.0),
                      child: Icon(
                        Icons.search_outlined,
                        color: Color.fromARGB(255, 154, 157, 161),
                      ),
                    ),
                  ]),
            ),
            body: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ChatSelector(),
                    ChatSelector(),
                    ChatSelector(),
                    ChatSelector(),
                    ChatSelector(),
                    ChatSelector(),
                    ChatSelector(),
                  ],
                ),
              ),
            ]))));
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
