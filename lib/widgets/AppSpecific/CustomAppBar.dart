import 'package:bookmeeter/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool newNotification = true;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 7.0),
                child: Text(
                  "BOOKMEETER",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline1,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 27,
                  height: 22,
                  child: Stack(children: [
                    Center(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.chatPage)
                        },
                        child: const Icon(
                          FontAwesomeIcons.envelope,
                          size: 20,
                          color: Color.fromARGB(255, 159, 159, 160),
                        ),
                      ),
                    ),
                    newNotification
                        ? Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              width: 10,
                              height: 10,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.redAccent,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          )
                        : Container()
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(/*dx*/ 4, /*dy*/ 4),
                              spreadRadius: -7,
                              blurRadius: 13.0),
                        ],
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'assets/testing/images/profile-image.jpg'),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]);
  }
}
