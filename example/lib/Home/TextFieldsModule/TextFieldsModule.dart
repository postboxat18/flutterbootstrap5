import 'package:example/Home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutterbootstrap5/flutterbootstrap5.dart';
import 'Widgets/TextFieldsWidgets.dart';

class TextFieldsModule extends StatefulWidget {
  const TextFieldsModule({super.key});

  @override
  State<TextFieldsModule> createState() => _TextFieldsModuleState();
}

class _TextFieldsModuleState extends State<TextFieldsModule> {
  @override
  Widget build(BuildContext context) {
    print(getData(MediaQuery.of(context).size.width));
    return SingleChildScrollView(
      child: FB5Row(
        children: [
          FB5Col(
            classNames:
                'col-xs-12 col-sm-5 col-md-4 col-lg-3 col-xl-3 col-xxl-3',
            child: menuFields(context),
          ),
          FB5Col(
            classNames:
                'col-xs-12 col-sm-7 col-md-8 col-lg-9 col-xl-9 col-xxl-9',
            child: textFields(context),
          ),
        ],
      ),
    );
  }
}
