
import 'package:example/Home/Dash/dash.dart';
import 'package:example/Home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutterbootstrap5latest/flutterbootstrap5latest.dart';

import 'Alert/AlertUI.dart';
import 'ChatBot/ChatBot.dart';
import 'DragAndDrop/DragAndDrop.dart';
import 'NavigationBarModule/NavBarModule.dart';
import 'Table/TableModule.dart';
import 'TextFieldsModule/TextFieldsModule.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double width;
  late int titleIndex = 0;
  late int multiIndex = -1;
  late int multi1Index = -1;

  late int intTitleHover = -1;
  late int intMultiHover = -1;
  late int intMulti1Hover = -1;

  late bool isDrawer = false;
  late List<String> moduleList = [
    "DashBoard Module",
    "Table Module",
    "Nav Module",
    "Alert Dialog",
    "Text Field Module",
    "Drag and Drop"

  ];
  late List<String> multiList1 = [
    "Multi 1",
    "Multi 2",
    "Multi 3",
    "Multi 4",
  ];
  late List<String> multiList2 = [
    "Bar 1",
    "Bar 2",
    "Bar 3",
    "Bar 4",
  ];
  late List<String> multiList3 = [
    "Nav 1",
    "Nav 2",
    "Nav 3",
    "Nav 4",
  ];

  late bool isDevice;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    isDevice = getData(width) == "xs" || getData(width) == "sm";
    //NAVIGATION RAIL
    return isDevice
        ? Scaffold(
            appBar: AppBar(
              title: Text("Home"),
            ),
            body: buildWidget(context),
            drawer: drawerFunc(),
      floatingActionButton: chatBot(),

          )
        : Scaffold(
            appBar: AppBar(
              elevation: 1,
              title: Text("Home"),
              leading: IconButton(
                  onPressed: () {
                    setState(() {
                      isDrawer = !isDrawer;
                    });
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
            ),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  //BODY
                  FB5Row(
                    children: [
                      FB5Col(
                        classNames: 'col-1',
                      ),
                      //BODY
                      FB5Col(
                        classNames: 'col-11',
                        child: buildWidget(context),
                      ),
                    ],
                  ),

                  //ON HOVER
                  if ((intTitleHover != -1 ||
                          intMultiHover != -1 ||
                          intMulti1Hover != -1) &&
                      !isDrawer) ...[
                    FB5Row(
                      children: [
                        FB5Col(
                          classNames: 'col-1',
                        ),
                        //TITLE
                        FB5Col(
                          classNames: 'col-3',
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: moduleList
                                .map((module) =>
                                    inkWellFunc(module, moduleList, 0, true))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                  //SIDE MENU
                  FB5Col(
                    classNames: isDrawer ? 'col-3' : 'col-1',
                    child: Container(
                        color: Colors.deepPurple,
                        child: Column(
                          children: [
                            //TITLE
                            ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: moduleList
                                  .map((module) =>
                                      inkWellFunc(module, moduleList, 0, false))
                                  .toList(),
                            ),

                            if (isDrawer) ...[
                              //exp 1
                              ExpansionTile(
                                iconColor: Colors.white,
                                collapsedIconColor: Colors.white,
                                title: expansionTitleFunc(1, isDrawer),
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: ListView(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      children: multiList1
                                          .map((module) => inkWellFunc(
                                              module, multiList1, 1, false))
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                              //EXP 2
                              ExpansionTile(
                                  title: expansionTitleFunc(1, isDrawer),
                                  iconColor: Colors.white,
                                  collapsedIconColor: Colors.white,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: ListView(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        children: multiList2
                                            .map((module) => inkWellFunc(
                                                module, multiList2, 2, false))
                                            .toList(),
                                      ),
                                    )
                                  ]),
                            ] else ...[
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isDrawer = !isDrawer;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.more_horiz_rounded,
                                    color: Colors.white,
                                  ))
                            ],
                          ],
                        )),
                  ),
                ],
              ),
            ),
      floatingActionButton: chatBot(),

            //drawer: drawerFunc(),
          );
  }

  buildWidget(BuildContext context) {
    return titleIndex == 0
        ? Dash()
        : titleIndex == 1
            ? TableModule()
            : titleIndex == 2
                ? NavBarModule()
                : titleIndex == 3
                    ? AlertUI()
                    : titleIndex == 4
                        ? TextFieldsModule()
                        : titleIndex == 5
                        ? DragAndDrop()
                        : Container(
                            color: Colors.yellow,
                          );
  }

  drawerFunc() {
    return Drawer(
      backgroundColor: Colors.deepPurple,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //TITLE
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: moduleList
                    .map((module) =>
                        inkWellDrawerFunc(module, moduleList, 0, false))
                    .toList(),
              ),
              //exp 1
              ExpansionTile(
                iconColor: Colors.white,
                collapsedIconColor: Colors.white,
                title: expansionTitleFunc(1, true),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: multiList1
                          .map((module) =>
                              inkWellDrawerFunc(module, multiList1, 1, false))
                          .toList(),
                    ),
                  ),
                ],
              ),
              //EXP 2
              ExpansionTile(
                  title: expansionTitleFunc(1, true),
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: multiList2
                            .map((module) =>
                                inkWellDrawerFunc(module, multiList2, 2, false))
                            .toList(),
                      ),
                    )
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  bool isSelectedModule(String module, List<String> moduleList, int index) {
    return index == moduleList.indexWhere((element) => element == module);
  }

  int selectedModule(String module, List<String> moduleList) {
    return moduleList.indexWhere((element) => element == module);
  }

  Widget inkWellFunc(
      String module, List<String> moduleList, int val, bool isHover) {
    return InkWell(
      onHover: isHover
          ? null
          : (value) {
              int index = value ? selectedModule(module, moduleList) : -1;
              setState(() {
                if (val == 0) {
                  intTitleHover = index;
                  intMultiHover = -1;
                  intMulti1Hover = -1;
                } else if (val == 1) {
                  intTitleHover = -1;
                  intMultiHover = index;
                  intMulti1Hover = -1;
                } else if (val == 2) {
                  intTitleHover = -1;
                  intMultiHover = -1;
                  intMulti1Hover = index;
                }
              });
            },
      onTap: () {
        setState(() {
          if (val == 0) {
            titleIndex = selectedModule(module, moduleList);
            multiIndex = -1;
            multi1Index = -1;
          } else if (val == 1) {
            titleIndex = -1;
            multiIndex = selectedModule(module, moduleList);
            multi1Index = -1;
          } else if (val == 2) {
            titleIndex = -1;
            multiIndex = -1;
            multi1Index = selectedModule(module, moduleList);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.all(15),
        color: isSelectedModule(
                    module,
                    moduleList,
                    val == 0
                        ? intTitleHover
                        : val == 1
                            ? intMultiHover
                            : intMulti1Hover) ||
                isSelectedModule(
                    module,
                    moduleList,
                    val == 0
                        ? titleIndex
                        : val == 1
                            ? multiIndex
                            : multi1Index)
            ? Colors.white
            : Colors.transparent,
        child: FB5Row(
          classNames: isDrawer || isHover
              ? 'justify-content-start'
              : 'justify-content-center',
          children: [
            FB5Col(
              child: Icon(
                isSelectedModule(
                            module,
                            moduleList,
                            val == 0
                                ? intTitleHover
                                : val == 1
                                    ? intMultiHover
                                    : intMulti1Hover) ||
                        isSelectedModule(
                            module,
                            moduleList,
                            val == 0
                                ? titleIndex
                                : val == 1
                                    ? multiIndex
                                    : multi1Index)
                    ? Icons.home
                    : Icons.home_outlined,
                color: isHover
                    ? Colors.transparent
                    : isSelectedModule(
                                module,
                                moduleList,
                                val == 0
                                    ? intTitleHover
                                    : val == 1
                                        ? intMultiHover
                                        : intMulti1Hover) ||
                            isSelectedModule(
                                module,
                                moduleList,
                                val == 0
                                    ? titleIndex
                                    : val == 1
                                        ? multiIndex
                                        : multi1Index)
                        ? Colors.deepPurple
                        : Colors.white,
              ),
            ),
            if (isDrawer || isHover) ...[
              FB5Col(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(isHover ? 0 : 15, 0, 0, 0),
                  child: Text(
                    module,
                    style: TextStyle(
                        color: isSelectedModule(
                                    module,
                                    moduleList,
                                    val == 0
                                        ? intTitleHover
                                        : val == 1
                                            ? intMultiHover
                                            : intMulti1Hover) ||
                                isSelectedModule(
                                    module,
                                    moduleList,
                                    val == 0
                                        ? titleIndex
                                        : val == 1
                                            ? multiIndex
                                            : multi1Index)
                            ? Colors.deepPurple
                            : isHover
                                ? Colors.transparent
                                : Colors.white,
                        fontSize: isSelectedModule(
                                    module,
                                    moduleList,
                                    val == 0
                                        ? intTitleHover
                                        : val == 1
                                            ? intMultiHover
                                            : intMulti1Hover) ||
                                isSelectedModule(
                                    module,
                                    moduleList,
                                    val == 0
                                        ? titleIndex
                                        : val == 1
                                            ? multiIndex
                                            : multi1Index)
                            ? 16
                            : 14,
                        fontWeight: isSelectedModule(
                                    module,
                                    moduleList,
                                    val == 0
                                        ? intTitleHover
                                        : val == 1
                                            ? intMultiHover
                                            : intMulti1Hover) ||
                                isSelectedModule(
                                    module,
                                    moduleList,
                                    val == 0
                                        ? titleIndex
                                        : val == 1
                                            ? multiIndex
                                            : multi1Index)
                            ? FontWeight.w700
                            : FontWeight.w400),
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }

  Widget inkWellDrawerFunc(
      String module, List<String> moduleList, int val, bool isHover) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          if (val == 0) {
            titleIndex = selectedModule(module, moduleList);
          } else if (val == 1) {
            multiIndex = selectedModule(module, moduleList);
          } else if (val == 2) {
            multi1Index = selectedModule(module, moduleList);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.all(15),
        color: isSelectedModule(
                module,
                moduleList,
                val == 0
                    ? titleIndex
                    : val == 1
                        ? multiIndex
                        : multi1Index)
            ? Colors.white
            : Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isSelectedModule(
                      module,
                      moduleList,
                      val == 0
                          ? titleIndex
                          : val == 1
                              ? multiIndex
                              : multi1Index)
                  ? Icons.home
                  : Icons.home_outlined,
              color: isHover
                  ? Colors.transparent
                  : isSelectedModule(
                          module,
                          moduleList,
                          val == 0
                              ? titleIndex
                              : val == 1
                                  ? multiIndex
                                  : multi1Index)
                      ? Colors.deepPurple
                      : Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                module,
                style: TextStyle(
                    color: isSelectedModule(
                            module,
                            moduleList,
                            val == 0
                                ? titleIndex
                                : val == 1
                                    ? multiIndex
                                    : multi1Index)
                        ? Colors.deepPurple
                        : Colors.white,
                    fontSize: isSelectedModule(
                            module,
                            moduleList,
                            val == 0
                                ? titleIndex
                                : val == 1
                                    ? multiIndex
                                    : multi1Index)
                        ? 16
                        : 14,
                    fontWeight: isSelectedModule(
                            module,
                            moduleList,
                            val == 0
                                ? titleIndex
                                : val == 1
                                    ? multiIndex
                                    : multi1Index)
                        ? FontWeight.w700
                        : FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }

  expansionTitleFunc(int val, bool isDrawer) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.home_outlined,
          color: Colors.white,
        ),
        if (isDrawer) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              "Multi Nav Bar $val",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ],
    );
  }

  chatBot() {
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      shape: CircleBorder(),
      onPressed: () {
        isDevice
            ? Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatBot1(),
            ))
            : openAlertDialog();
      },
      child: Icon(
        Icons.chat_outlined,
        color: Colors.white,
      ),
    );
  }

  openAlertDialog() {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black54,
      barrierDismissible: true,
      barrierLabel: 'Label',
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.8,
            margin: EdgeInsets.all(15),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.2,
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: ChatBot1(),
          ),
        );
      },
    );
  }
}
