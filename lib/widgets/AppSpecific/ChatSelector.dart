import 'package:bookmeeter/routes.dart';
import 'package:flutter/material.dart';

class ChatSelector extends StatefulWidget {
  ChatSelector({
    Key? key,
  }) : super(key: key);

  @override
  _ChatSelectorState createState() => _ChatSelectorState();
}

class _ChatSelectorState extends State<ChatSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 75,
      child: InkWell(
        focusColor: const Color.fromARGB(25, 167, 167, 167),
        splashColor: const Color.fromARGB(25, 167, 167, 167),
        onTap: () => {
          Navigator.of(context).pushNamed(RouteGenerator.chat)
        }, // stop recording when released
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          child: Stack(children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "00:00",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 242, 243, 244),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          AssetImage('assets/testing/images/profile-image.jpg'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nome Utente",
                        style: Theme.of(context).textTheme.subtitle1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Last Message",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
