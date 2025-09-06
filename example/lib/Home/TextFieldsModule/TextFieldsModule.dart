import 'package:example/Home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutterbootstrap5latest/flutterbootstrap5latest.dart';
import 'Widgets/TextFieldsWidgets.dart';

class TextFieldsModule extends StatefulWidget {
  const TextFieldsModule({super.key});

  @override
  State<TextFieldsModule> createState() => _TextFieldsModuleState();
}

class _TextFieldsModuleState extends State<TextFieldsModule> {
  @override
  Widget build(BuildContext context) {
    // 'col-xs-12 col-sm-7 col-md-8 col-lg-9 col-xl-9 col-xxl-9',

    return SingleChildScrollView(
      child: FB5Col(

        child: textFields(context),
      ),
    );
  }
}
