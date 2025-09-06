import 'package:example/Utils/ColorFile.dart';
import 'package:flutter/material.dart';

gradientFunc() {
  return LinearGradient(
        colors: [
          primary,
          primary1,
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp);
}
