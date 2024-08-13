import 'package:bookmeeter/routes.dart';
import 'package:flutter/material.dart';

class BookPreview extends StatefulWidget {
  bool? cleanVersion;
  double? width;
  double? height;

  BookPreview(
      {Key? key,
      this.cleanVersion = false,
      this.width = 110,
      this.height = 170})
      : super(key: key);

  @override
  _BookPreviewState createState() => _BookPreviewState();
}

class _BookPreviewState extends State<BookPreview> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (!widget.cleanVersion!)
          Navigator.of(context).pushNamed(RouteGenerator.productPage)
      },
      onLongPressStart: (longPress) => {
        if (!widget.cleanVersion!)
          setState(() {
            _visible = true;
          })
      }, // start recording when long pressed
      onLongPressEnd: (longPress) => {
        if (!widget.cleanVersion!)
          setState(() {
            _visible = false;
          })
      }, // stop recording when released
      child: widget.cleanVersion!
          ? Container(
              width: widget.width,
              height: widget.height,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              //width: 95,
              //height: 150,
              //width: MediaQuery.of(context).size.width * 0.23,
              //height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(7),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(/*dx*/ 0, /*dy*/ 5),
                      spreadRadius: -6,
                      blurRadius: 12.0),
                ],
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/testing/images/book.jpg'),
                ),
              ),
            )
          : Container(
              width: widget.width,
              height: widget.height,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              //width: 95,
              //height: 150,
              //width: MediaQuery.of(context).size.width * 0.23,
              //height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                //color: Colors.white,
                /*border: Border.all(
                    color: const Color.fromARGB(255, 0, 5, 26), width: 1.5),*/
                borderRadius: BorderRadius.circular(7),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(/*dx*/ 1, /*dy*/ 5),
                      spreadRadius: -8,
                      blurRadius: 10.0 /*10*/,
                      blurStyle: BlurStyle.solid),
                ],
                /*image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/testing/images/book.jpg'),
          ),*/
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/testing/images/book.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedOpacity(
                      opacity: _visible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        margin: const EdgeInsets.all(3.0),
                        height: 65,
                        width: widget.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    "Editore",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    "Titolo",
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
