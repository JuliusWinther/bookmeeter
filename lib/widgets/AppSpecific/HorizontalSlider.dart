import 'package:bookmeeter/widgets/AppSpecific/BookPreview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HorizontalSlider extends StatefulWidget {
  Color? color;
  double? height;
  String title = "Placeholder";

  HorizontalSlider(
      {Key? key,
      this.color = Colors.transparent,
      this.height = 190,
      required this.title})
      : super(key: key);

  @override
  _HorizontalSliderState createState() => _HorizontalSliderState();
}

class _HorizontalSliderState extends State<HorizontalSlider> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    //Icons.more_horiz,
                    Icons.hdr_strong,
                    size: 22,
                    color: Color.fromARGB(255, 144, 141, 142),
                  )
                ],
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              height:
                  widget.height, //MediaQuery.of(context).size.height * 0.23,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 13)),
                  BookPreview(),
                  BookPreview(),
                  BookPreview(),
                  BookPreview(),
                  BookPreview(),
                  BookPreview(),
                  BookPreview(),
                  BookPreview(),
                  const Padding(padding: EdgeInsets.only(left: 13)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
