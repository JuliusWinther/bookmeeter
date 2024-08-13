import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  final double? size;

  const LoadingIndicator({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Center(
      child: SpinKitRotatingPlain(color: Colors.grey, size: size ?? 45.0),
    ));
  }
}
