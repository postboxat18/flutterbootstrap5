import 'package:flutter/material.dart';
import 'package:flutterbootstrap5latest/flutterbootstrap5latest.dart';


getWrapper(String data, Widget child) {
  switch (data) {
    case "xs":
      return FB5Container(
        child: child,
      );
    case "sm":
      return FB5Container.sm(
        child: child,
      );
    case "md":
      return FB5Container.md(
        child: child,
      );
    case "lg":
      return FB5Container.lg(
        child: child,
      );
    case "xl":
      return FB5Container.xl(
        child: child,
      );
    case "xxl":
      return FB5Container.xxl(
        child: child,
      );
    case "fluid":
      return FB5Container.fluid(
        child: child,
      );
  }
}

String getData(double width) {
  String data = "";

  if (width >= 0 && width <= 576) {
    data = "xs";
  } else if (width >= 576 && width <= 768) {
    data = "sm";
  } else if (width >= 768 && width <= 992) {
    data = "md";
  } else if (width >= 992 && width <= 1200) {
    data = "lg";
  } else if (width >= 1200 && width <= 1400) {
    data = "xl";
  } else if (width >= 1400 && width <= double.infinity) {
    data = "xxl";
  }
  return data;
}
