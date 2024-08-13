import 'package:bookmeeter/widgets/OnHover.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

bool _display = false;

class TextLink extends StatelessWidget {
  final Function() whenClicked;
  final Function()? executeOnHover;
  final String text;
  final EdgeInsets? margin;
  final Color? hoverColor;
  final Color? normalColor;

  const TextLink(
      {Key? key,
      required this.whenClicked,
      required this.text,
      this.margin,
      this.executeOnHover,
      this.normalColor = Colors.black,
      this.hoverColor = Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final hovered = Matrix4.identity()..translate(0, -10, 0);
    //final transform = isHovered ? hovered : Matrix4.identity();

    return Container(
        margin: margin,
        child: OnHover(builder: (isHovered) {
          final color = isHovered ? hoverColor : normalColor;
          if (executeOnHover != null) {
            executeOnHover!();
          }
          return RichText(
              text: TextSpan(children: [
            TextSpan(
                text: text,
                style: TextStyle(color: color),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    whenClicked();
                  })
          ]));
        }));
  }
}
