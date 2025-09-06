import 'package:flutter/material.dart';
import '../../Utils/ColorFile.dart';
import '../Alert/AlertUI.dart';
import '../Dash/dash.dart';
import '../Table/TableModule.dart';
import '../TextFieldsModule/TextFieldsModule.dart';
import '../utils/UtilsWidgets.dart';
import '../widgets/widgets.dart';

class NavBarModule extends StatefulWidget {
  const NavBarModule({super.key});

  @override
  State<NavBarModule> createState() => _NavBarModuleState();
}

class _NavBarModuleState extends State<NavBarModule> {
  late int index = 0;
  late List<String> moduleList = [
    "DashBoard",
    "TableView",
    "Alert",
    "TextFields"
  ];
  late double width;
  late bool isDevice;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    isDevice = getData(width) == "xs" || getData(width) == "sm";
    return isDevice
        ? Scaffold(
            backgroundColor: bgClr,
            body: buildWidget(context),
            bottomNavigationBar: BottomAppBar(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: moduleList
                    .map((module) => InkWell(
                          child: Icon(
                            index == selectedModule(module, moduleList)
                                ? Icons.home
                                : Icons.home_outlined,
                            color: primary,
                          ),
                          onTap: () {
                            setState(() {
                              index = selectedModule(module, moduleList);
                            });
                          },
                        ))
                    .toList(),
              ),
            ),
          )
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: moduleList
                    .map((module) => InkWell(
                          child: Container(
                            decoration: index ==
                                selectedModule(module, moduleList)
                                ?  ShapeDecoration(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                gradient: gradientFunc()):ShapeDecoration(shape: RoundedRectangleBorder()),
                            width: 150,
                            padding: EdgeInsets.all(15),
                            child: Text(
                              module,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: index ==
                                          selectedModule(module, moduleList)
                                      ? FontWeight.bold
                                      : FontWeight.w400,
                                  color: index ==
                                          selectedModule(module, moduleList)
                                      ? Colors.white
                                      : textFieldClr),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              index = selectedModule(module, moduleList);
                            });
                          },
                        ))
                    .toList(),
              ),
              buildWidget(context)
            ],
          );
  }

  selectedModule(String module, List<String> moduleList) {
    return moduleList.indexWhere((element) => element == module);
  }

  buildWidget(BuildContext context) {
    return index == 0
        ? Dash()
        : index == 1
            ? TableModule()
            : index == 2
                ? AlertUI()
                : TextFieldsModule();
  }
}
