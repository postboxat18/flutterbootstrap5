import 'package:flutter/material.dart';
import 'package:flutter_listfilter/flutter_listfilter.dart';


import 'package:flutterbootstrap5latest/flutterbootstrap5latest.dart';
import 'package:grouped_list/grouped_list.dart';
import '../Table/TableModule.dart';
import '../widgets/widgets.dart';
import 'Model/DragAndDropModel.dart';

class DragAndDrop extends StatefulWidget {
  const DragAndDrop({super.key});

  @override
  State<DragAndDrop> createState() => _DragAndDropState();
}

class _DragAndDropState extends State<DragAndDrop> {
  late List<String> tableModuleLis = [
    "RegNo",
    "PatName",
    "doctorname",
    "Age",
    "sex",
    "batch"
  ];

  late List<String> batchList = [];
  late Map<String, List<DragAndDropModel>> dragAndDropMap = {};
  late List<DragAndDropModel> dragAndDropList = [];
  late double width;

  @override
  void initState() {
    //GET LIST
    for (var res in getJson()) {
      var list = DragAndDropModel.fromJson(res);
      dragAndDropList.add(list);
    }
    batchList = [];
    //GET UNIQUE LIST
    List<DragAndDropModel> uniqueList = [];
    var set = <String>{};
    uniqueList = dragAndDropList
        .where((element) => set.add(element.batch.toString()))
        .toList();

    //GET HEADER LIST
    for (var res in uniqueList) {
      batchList.add(res.batch.toString());
    }
    //SORT
    batchList.sort(
      (a, b) => a.compareTo(b),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: FlutterListFilter(
          dynamicList: dragAndDropList,
          filterHeaderList: tableModuleLis,
          primaryColor: Colors.blue,
          lineColor: Colors.grey,
          builder: (List<DragAndDropModel> dragAndDropList) {
            dragAndDropMap = {};

            //SEPARATE LIST
            List<DragAndDropModel> separateList = [];
            for (var res in batchList) {
              separateList = dragAndDropList
                  .where((element) => element.batch == res)
                  .toList();
              dragAndDropMap.addAll({res: separateList});
            }
            return FB5Row(children: [
              //HEADER
              if (getData(width) == "xs" ||
                  getData(width) == "sm" ||
                  getData(width) == "md") ...[
                FB5Col(
                  child: mobileView(dragAndDropList, dragAndDropMap),
                )
              ] else ...[
                ...batchList.map(
                  (header) => FB5Col(
                    child: Container(
                      color: Colors.grey[200],
                      child: webView(header, dragAndDropMap),
                    ),
                  ),
                ),
              ]
            ]);
          }),
    );
  }

  childFunc(
      dragList, String header, bool isDrag, bool isMobile, dragAndDropMap) {
    return Card(
      color: isDrag ? Colors.grey[300] : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Wrap(
          runSpacing: 5,
          spacing: 5,
          children: tableModuleLis
              .map((key) => FB5Col(
                    child: Wrap(
                      runSpacing: 5,
                      spacing: 5,
                      children: [
                        if (key == "RegNo") ...[
                          FB5Col(
                            child: Icon(
                              Icons.person_outline_rounded,
                              color: isDrag ? Colors.transparent : Colors.grey,
                              size: 20,
                            ),
                          ),
                        ],
                        if (key == "batch" && isMobile) ...[
                          FB5Col(
                            child: FB5Row(
                              classNames: 'justify-content-between',
                              children: [
                                FB5Col(
                                  classNames: 'col-8',
                                  child: FB5Row(
                                    children: [
                                      FB5Col(
                                        child: Text(
                                          "$key:",
                                          style: TextStyle(
                                              color: isDrag
                                                  ? Colors.transparent
                                                  : Colors.grey),
                                        ),
                                      ),
                                      FB5Col(
                                        child: Text(
                                          dragList.get(key),
                                          style: TextStyle(
                                              color: isDrag
                                                  ? Colors.transparent
                                                  : Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                FB5Col(
                                  child: IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8),
                                                  topLeft: Radius.circular(8))),
                                          context: context,
                                          builder: (context) =>
                                              showBottomSheetFunc(header,
                                                  dragList, dragAndDropMap),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.compare_arrows_rounded,
                                        color: Colors.deepPurple,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ] else ...[
                          FB5Col(
                            child: Text(
                              "$key:",
                              style: TextStyle(
                                  color: isDrag
                                      ? Colors.transparent
                                      : Colors.grey),
                            ),
                          ),
                          FB5Col(
                            child: Text(
                              dragList.get(key),
                              style: TextStyle(
                                  color: isDrag
                                      ? Colors.transparent
                                      : Colors.black),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  mobileView(List<DragAndDropModel> dragAndDropList, dragAndDropMap) {
    return GroupedListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      sort: true,
      floatingHeader: true,
      useStickyGroupSeparators: true,
      elements: dragAndDropList,
      groupBy: (element) => element.batch,
      groupComparator: (value1, value2) => value1!.compareTo(value2 ?? ""),
      groupSeparatorBuilder: (value) {
        List<DragAndDropModel> dragList = dragAndDropMap[value] ?? [];

        return FB5Col(
          classNames: 'mt-3',
          child: Text(
            "$value  (${dragList.length})",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        );
      },
      itemComparator: (element1, element2) =>
          element1.batch!.compareTo(element2.batch ?? ""),
      itemBuilder: (context, element) => childFunc(
          element, element.batch.toString(), false, true, dragAndDropMap),
    );
  }

  webView(String header, dragAndDropMap) {
    return DragTarget(onAccept: (data) {
      updateMap(header, data, dragAndDropMap);
    }, builder: (context, candidateData, rejectedData) {
      List<DragAndDropModel> dragList = dragAndDropMap[header] ?? [];
      return Container(
        color: candidateData.isEmpty ? Colors.grey[200] : Colors.grey[300],
        child: Column(children: [
          Text(
            "$header (${dragList.length})",
            style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          if (dragAndDropMap[header]?.isEmpty ?? true) ...[
            FB5Col(
              classNames: 'col-3',
              child: Card(
                elevation: 0,
                color: candidateData.isEmpty ? Colors.grey[200] : Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: tableModuleLis
                        .map((key) => Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: [
                                if (key == "RegNo") ...[
                                  FB5Col(
                                    child: const Icon(
                                      Icons.person_outline_rounded,
                                      color: Colors.transparent,
                                      size: 20,
                                    ),
                                  ),
                                ],
                                FB5Col(
                                  child: const Text(
                                    "child",
                                    style: TextStyle(color: Colors.transparent),
                                  ),
                                ),
                                FB5Col(
                                  child: const Text(
                                    "key store",
                                    style: TextStyle(color: Colors.transparent),
                                  ),
                                )
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),
            )
          ] else ...[
            ...dragAndDropMap[header]!.map((dragList) => FB5Col(
                  classNames: 'col-lg-3 col-xl-3 col-xxl-3',
                  child: Draggable(
                    data: {header: dragList},
                    childWhenDragging: childFunc(
                        dragList, header, true, false, dragAndDropMap),
                    feedback: SizedBox(
                      width: getData(width) == "xxl"
                          ? double.infinity / 5
                          : getData(width) == "xl"
                              ? 1400 / 5
                              : getData(width) == "lg"
                                  ? 1200 / 5
                                  : 200,
                      child: childFunc(
                          dragList, header, false, false, dragAndDropMap),
                    ),
                    child: childFunc(
                        dragList, header, false, false, dragAndDropMap),
                  ),
                ))
          ]
        ]),
      );
    });
  }

  showBottomSheetFunc(String header, dragList, dragAndDropMap) {
    return FB5Col(
      classNames: 'p-2',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //HEADING
          FB5Row(
            children: [
              FB5Col(
                  classNames: 'me-2',
                  child: Icon(
                    Icons.compare_arrows_rounded,
                    color: Colors.deepPurple,
                  )),
              FB5Col(
                child: Text(
                  "$header is Move to",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          ...batchList.map((batch) {
            return FB5Row(
              children: [
                if (batch != header) ...[
                  FB5Col(
                    child: RadioListTile(
                      title: Text(
                        batch,
                        style: const TextStyle(color: Colors.black),
                      ),
                      value: false,
                      groupValue: 2,
                      onChanged: (value) {
                        Navigator.pop(context);
                        updateMap(batch, {header: dragList}, dragAndDropMap);
                      },
                    ),
                  )
                ]
              ],
            );
          })
        ],
      ),
    );
  }

  void updateMap(header, data, dragAndDropMap) {
    Map<dynamic, dynamic> map = data as Map;
    var entries = map.entries.toList();
    //ADD
    DragAndDropModel list = entries[0].value;
    list.batch = header;
    dragAndDropMap[header]?.add(list);

    //REMOVE
    dragAndDropMap[entries[0].key]?.remove(entries[0].value);
    setState(() {});
  }
}


