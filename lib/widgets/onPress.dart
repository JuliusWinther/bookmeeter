import 'package:flutter/material.dart';

class OnPress extends StatefulWidget {
  final Widget Function() builder;
  final Function() whenPressed;

  const OnPress({Key? key, required this.builder, required this.whenPressed})
      : super(key: key);

  @override
  _OnPressState createState() => _OnPressState();
}

class _OnPressState extends State<OnPress> {
  @override
  Widget build(BuildContext context) {
    //final hovered = Matrix4.identity()..translate(0, -10, 0);
    //final transform = isHovered ? hovered : Matrix4.identity();

    return InkWell(
      //duration: Duration(milliseconds: 300),
      //transform: transform,
      onTap: () => {widget.whenPressed()},
      child: widget.builder(),
    );
  }
}
