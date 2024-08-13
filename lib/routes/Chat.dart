import 'dart:ui';

import 'package:bookmeeter/routes.dart';
import 'package:bookmeeter/routes/ChatListPage.dart';
import 'package:bookmeeter/widgets/AppSpecific/BookPreview.dart';
import 'package:bookmeeter/widgets/AppSpecific/ChatSelector.dart';
import 'package:bookmeeter/widgets/AppSpecific/HorizontalSlider.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _inputController = TextEditingController();

  String _text = "";
  List<String> _msg = [];

  @override
  Widget build(BuildContext context) {
    return (Theme(
        data: Theme.of(context).copyWith(
            scaffoldBackgroundColor: const Color.fromARGB(255, 228, 228, 228),
            backgroundColor: const Color.fromARGB(255, 228, 228, 228)),
        //backgroundColor: Colors.white,

        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            centerTitle: true,
            surfaceTintColor: const Color.fromARGB(255, 17, 171, 205),
            backgroundColor: const Color.fromARGB(255, 17, 171, 205),
            automaticallyImplyLeading: false,
            toolbarHeight: 60,
            leadingWidth: MediaQuery.of(context).size.width,
            systemOverlayStyle: const SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Color.fromARGB(255, 17, 171, 205),

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
                    onTap: () => {
                      Navigator.pop(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRightPop,
                              child: const ChatListPage(),
                              childCurrent: widget))
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 7.0),
                      child: Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Nome Utente",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 7.0),
                  ),
                ]),
          ),
          body: ListView.builder(
            itemCount: _msg.length,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            itemBuilder: (BuildContext context, int index) {
              return Bubble(
                nip: BubbleNip.rightTop,
                margin: const BubbleEdges.only(top: 10),
                alignment: Alignment.topRight,
                child: SelectableText(
                  _msg[index],
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
              );
            },
          ),
          bottomSheet: Container(
            height: 75,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 17, 171, 205),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => {
                    if (_text.isNotEmpty)
                      setState(() {
                        _inputController.clear();
                        _msg.add(_text);
                        _text = "";
                      })
                  },
                  child: const Icon(Icons.file_upload_outlined,
                      color: Colors.white, size: 28),
                ),
                SizedBox(
                  width: 270,
                  height: 40,
                  child: TextFormField(
                    maxLines: 1,
                    controller: _inputController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.send,
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors
                            .white, //const Color.fromARGB(255, 230, 230, 230),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        labelText: 'Scrivi un messaggio ...',
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never),
                    onChanged: (value) => {_text = value},
                    onFieldSubmitted: (value) => {
                      if (value.isNotEmpty)
                        setState(() {
                          _inputController.clear();
                          _text = "";
                          _msg.add(value);
                        })
                    },
                  ),
                ),
                InkWell(
                  onTap: () => {
                    if (_text.isNotEmpty)
                      setState(() {
                        _inputController.clear();
                        _msg.add(_text);
                        _text = "";
                      })
                  },
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        )));
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
