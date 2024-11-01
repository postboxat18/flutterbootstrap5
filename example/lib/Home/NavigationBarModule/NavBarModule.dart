import 'package:flutter/material.dart';
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
                            color: Colors.deepPurple,
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
              AppBar(
                actions: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30),),
                        gradient: gradientFunc()),
                    child: Row(
                      children: moduleList
                          .map((module) => InkWell(
                                child: Container(
                                  width: 150,
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    module,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: index ==
                                                selectedModule(
                                                    module, moduleList)
                                            ? FontWeight.bold
                                            : FontWeight.w400,
                                        color: index ==
                                                selectedModule(
                                                    module, moduleList)
                                            ? Colors.deepPurple
                                            : Colors.white),
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
                  )
                ],
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
