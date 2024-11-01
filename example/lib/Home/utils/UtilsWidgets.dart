import 'package:flutter/material.dart';

gradientFunc() {
  return LinearGradient(
        colors: [
          Colors.deepPurple,
          Colors.white,
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp);
}
