import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:example/Utils/ColorFile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_listfilter/flutter_listfilter.dart';

import 'package:flutterbootstrap5latest/flutterbootstrap5latest.dart';

import '../utils/UtilsWidgets.dart';
import '../widgets/widgets.dart';
import 'Model/DataTableList.dart';

class TableModule extends StatefulWidget {
  const TableModule({super.key});

  @override
  State<TableModule> createState() => _TableModuleState();
}

class _TableModuleState extends State<TableModule> {
  late List<String> tableModuleLis = [
    "RegNo",
    "PatName",
    "doctorname",
    "Age",
    "sex",
  ];
  late List<DataTableList> tableList = [];
  late List<DataTableList> selectedDataTableList = [];
  late List<DataTableList> dataTableList = [];
  late bool sort = false;
  late int columnIndexSort = 0;

  late SingleValueDropDownController dropDownController =
      SingleValueDropDownController(
    data: DropDownValueModel(name: "All", value: 3),
  );
  late List<DropDownValueModel> dropDownList = [
    DropDownValueModel(name: "5", value: 0),
    DropDownValueModel(name: "10", value: 1),
    DropDownValueModel(name: "15", value: 2),
    DropDownValueModel(name: "All", value: 3),
  ];

  late int selectedIndex = 1;
  late int startPage;
  late int endPage;
  late int pageVisible;
  late int numOfPage;
  late double width;
  late Color lightPurple = Color(0xFFD1C4E9);
  late double iconSize = 50;

  @override
  void initState() {
    for (var res in getJson()) {
      var list = DataTableList.fromJson(res);
      tableList.add(list);
    }
    calculateVisiblePages(tableList.length, tableList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    dataTableList = selectedDataTableList.isEmpty
        ? dropDownController.dropDownValue?.name == "All"
            ? tableList
            : dataTableList
        : selectedDataTableList;

    return getData(width) == "xs" || getData(width) == "sm"
        ? tableMobileView()
        : tableWebView();
  }

  calculateVisiblePages(int pagesVisible, List<DataTableList> tableList) {
    int numOfPages = (tableList.length / pagesVisible).ceil();
    int selectedPage = selectedIndex + 1;

    /// If the number of pages is less than or equal to the number of pages visible, then show all the pages
    if (numOfPages <= pagesVisible) {
      startPage = 1;
      endPage = numOfPages;
    } else {
      /// If the number of pages is greater than the number of pages visible, then show the pages visible
      int middle = (pagesVisible - 1) ~/ 2;
      if (selectedPage <= middle + 1) {
        startPage = 1;
        endPage = pagesVisible;
      } else if (selectedPage >= numOfPages - middle) {
        startPage = numOfPages - (pagesVisible - 1);
        endPage = numOfPages;
      } else {
        startPage = selectedPage - middle;
        endPage = selectedPage + middle;
      }
    }

    setState(() {
      pageVisible = pagesVisible;
      numOfPage = numOfPages;
      startPage;
      endPage;
    });
  }

  Widget showAlertDialog(List<DataTableList> uniqueDataTableList, String res,
      StateSetter setAlertState) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var unique in uniqueDataTableList) ...[
            CheckboxListTile(
              value: selectedDataTableList.contains(unique),
              onChanged: (value) {
                if (value == true) {
                  List<DataTableList> list = [];
                  for (int i = (selectedIndex - 1) * pageVisible;
                      i <
                          ((selectedIndex * pageVisible) > dataTableList.length
                              ? dataTableList.length
                              : (selectedIndex * pageVisible));
                      i++) {
                    if (dataTableList[i].get(res) == unique.get(res)) {
                      list.add(dataTableList[i]);
                    }
                  }

                  selectedDataTableList.addAll(list);
                } else {
                  selectedDataTableList.remove(unique);
                }

                setAlertState(() {
                  selectedDataTableList;
                });
                calculateVisiblePages(
                    selectedDataTableList.isEmpty
                        ? tableList.length
                        : selectedDataTableList.length,
                    selectedDataTableList.isEmpty
                        ? tableList
                        : selectedDataTableList);

                setState(() {
                  dropDownController = SingleValueDropDownController(
                    data: DropDownValueModel(name: "All", value: 3),
                  );
                  selectedIndex = 1;
                  selectedDataTableList;
                });
              },
              title: Text(unique.get(res)),
            )
          ],
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      Navigator.pop(context);
                      setAlertState(() {
                        selectedDataTableList = [];
                      });
                      calculateVisiblePages(
                          selectedDataTableList.isEmpty
                              ? tableList.length
                              : selectedDataTableList.length,
                          selectedDataTableList.isEmpty
                              ? tableList
                              : selectedDataTableList);
                      setState(() {
                        selectedDataTableList = [];
                        dropDownController = SingleValueDropDownController(
                          data: DropDownValueModel(name: "All", value: 3),
                        );
                        selectedIndex = 1;
                      });
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: primary),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: primary),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Apply",
                      style: TextStyle(color: primary),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  showingText() {
    return Text(
        "Showing ${(selectedIndex - 1) * pageVisible + 1} to ${((selectedIndex * pageVisible) > dataTableList.length ? dataTableList.length : (selectedIndex * pageVisible))} of ${tableList.length}");
  }

  paginationFunc() {
    return FB5Row(classNames: 'justify-content-center', children: [
      //BACK
      FB5Col(
        height: 50,
        classNames: 'justify-content-center',
        child: IconButton(
            onPressed: selectedIndex > 1
                ? () {
                    setState(() {
                      selectedIndex -= 1;
                    });
                    calculateVisiblePages(
                        dropDownController.dropDownValue?.name == "All"
                            ? dataTableList.length
                            : int.parse(dropDownController.dropDownValue!.name),
                        dataTableList);
                  }
                : null,
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: selectedIndex > 1 ? Colors.grey : Colors.transparent,
            )),
      ),
      FB5Col(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            for (int i = startPage; i <= endPage; i++) ...[
              InkWell(
                child: Card(
                  color: selectedIndex == i ? Colors.white : bgClr,
                  elevation: selectedIndex == i ? 1 : 0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Text(
                      i.toString(),
                      style: TextStyle(
                          color:
                              selectedIndex == i ? Colors.black : Colors.black),
                    ),
                  ),
                ),
                onTap: () {
                  calculateVisiblePages(
                      dropDownController.dropDownValue?.name == "All"
                          ? dataTableList.length
                          : int.parse(dropDownController.dropDownValue!.name),
                      dataTableList);
                  setState(() {
                    selectedIndex = i;
                  });
                },
              ),
            ]
          ],
        ),
      ),
      //NEXT
      FB5Col(
        height: 50,
        classNames: 'justify-content-center',
        child: IconButton(
            onPressed: selectedIndex < numOfPage
                ? () {
                    setState(() {
                      selectedIndex += 1;
                    });
                    calculateVisiblePages(
                        dropDownController.dropDownValue?.name == "All"
                            ? dataTableList.length
                            : int.parse(dropDownController.dropDownValue!.name),
                        dataTableList);
                  }
                : null,
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              color:
                  selectedIndex < numOfPage ? Colors.grey : Colors.transparent,
            )),
      ),
    ]);
  }

  tableWebView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    width: 100,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropDownTextField(
                            clearOption: false,
                            controller: dropDownController,
                            enableSearch: false,
                            onChanged: (value) {
                              setState(() {
                                dropDownController;
                                selectedIndex = 1;
                              });
                              calculateVisiblePages(
                                  value.name == "All"
                                      ? dataTableList.length
                                      : int.parse(value.name.toString()),
                                  dataTableList);
                            },
                            textFieldDecoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1))),
                            dropDownList: dropDownList),
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "Entries per Page",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
            //DATA TABLE
            Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                primary: true,
                child: Container(
                  width: width,
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          iconTheme: Theme.of(context)
                              .iconTheme
                              .copyWith(color: primary)),
                      child: DataTable(
                        sortAscending: sort,
                        sortColumnIndex: columnIndexSort,
                        border: TableBorder.all(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: borderClr,
                            style: BorderStyle.solid,
                            width: 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        // headingRowColor: MaterialStateColor.resolveWith(
                        //     (states) => primary),
                        // dataRowColor: MaterialStateColor.resolveWith(
                        //   (states) => lightPurple,
                        // ),
                        columns: tableModuleLis
                            .map((res) => DataColumn(
                                onSort: (columnIndex, ascending) {
                                  setState(() {
                                    sort = !sort;
                                    columnIndexSort = columnIndex;
                                  });
                                  if (columnIndex == columnIndexSort) {
                                    List<DataTableList> existing = [];
                                    for (int i =
                                            (selectedIndex - 1) * pageVisible;
                                        i <
                                            ((selectedIndex * pageVisible) >
                                                    dataTableList.length
                                                ? dataTableList.length
                                                : (selectedIndex *
                                                    pageVisible));
                                        i++) {
                                      existing.add(dataTableList[i]);
                                    }

                                    if (ascending) {
                                      dataTableList.sort((a, b) =>
                                          a.get(res).compareTo(b.get(res)));
                                    } else {
                                      dataTableList.sort((a, b) =>
                                          b.get(res).compareTo(a.get(res)));
                                    }
                                  }
                                },
                                label: Row(
                                  children: [
                                    Text(
                                      res,
                                      style: TextStyle(
                                          color: primary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        var set = <String>{};
                                        List<DataTableList> existing = [];
                                        for (int i = (selectedIndex - 1) *
                                                pageVisible;
                                            i <
                                                ((selectedIndex * pageVisible) >
                                                        dataTableList.length
                                                    ? dataTableList.length
                                                    : (selectedIndex *
                                                        pageVisible));
                                            i++) {
                                          existing.add(dataTableList[i]);
                                        }
                                        List<DataTableList>
                                            uniqueDataTableList = existing
                                                .where((element) =>
                                                    set.add(element.get(res)))
                                                .toList();

                                        getData(width) == "xs" ||
                                                getData(width) == "sm" ||
                                                getData(width) == "md"
                                            ? showModalBottomSheet(
                                                context: context,
                                                builder: (context) {
                                                  return StatefulBuilder(
                                                    builder: (context,
                                                            setStateFul) =>
                                                        showAlertDialog(
                                                            uniqueDataTableList,
                                                            res,
                                                            setStateFul),
                                                  );
                                                },
                                              )
                                            : showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return StatefulBuilder(
                                                    builder: (context,
                                                            setStateFul) =>
                                                        AlertDialog(
                                                      content: showAlertDialog(
                                                          uniqueDataTableList,
                                                          res,
                                                          setStateFul),
                                                    ),
                                                  );
                                                },
                                              );
                                      },
                                      icon: Icon(
                                        Icons.filter_alt_outlined,
                                        color: primary,
                                      ),
                                    ),
                                  ],
                                )))
                            .toList(),
                        rows: [
                          for (int i = (selectedIndex - 1) * pageVisible;
                              i <
                                  ((selectedIndex * pageVisible) >
                                          dataTableList.length
                                      ? dataTableList.length
                                      : (selectedIndex * pageVisible));
                              i++) ...[
                            DataRow(
                                cells: tableModuleLis
                                    .map((index) => DataCell(
                                          Text(
                                            dataTableList[i]
                                                .get(index)
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              selectedDataTableList = [];
                                              List<DataTableList> list = [];
                                              for (int j = (selectedIndex - 1) *
                                                      pageVisible;
                                                  j <
                                                      ((selectedIndex *
                                                                  pageVisible) >
                                                              dataTableList
                                                                  .length
                                                          ? dataTableList.length
                                                          : (selectedIndex *
                                                              pageVisible));
                                                  j++) {
                                                if (dataTableList[j]
                                                        .get(index) ==
                                                    dataTableList[i]
                                                        .get(index)) {
                                                  list.add(dataTableList[j]);
                                                }
                                              }

                                              selectedDataTableList = list;
                                              dropDownController =
                                                  SingleValueDropDownController(
                                                data: DropDownValueModel(
                                                    name: "All", value: 3),
                                              );
                                            });
                                          },
                                        ))
                                    .toList())
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //PAGINATION

            FB5Row(
              classNames:
                  'row-cols-md-3 row-cols-lg-4 row-cols-xl-5 row-cols-xxl-5 justify-content-between',
              children: [
                FB5Col(
                  classNames: 'justify-content-center',
                  child: showingText(),
                ),
                FB5Col(
                  classNames: 'justify-content-center',
                  child: paginationFunc(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  tableMobileView() {
    return SingleChildScrollView(
      child: FlutterListFilter(
          backgroundColor: bgClr,
          dynamicList: tableList,
          filterHeaderList: tableModuleLis,
          primaryColor: primary,
          lineColor: textFieldClr,
          builder: (List<dynamic> tableList) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: tableList
                  .map((module) => Card(
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              if (module.get("sex") == "MALE") ...[
                                Image.asset(
                                  "assets/male.png",
                                  height: iconSize,
                                  width: iconSize,
                                ),
                              ] else ...[
                                Image.asset(
                                  "assets/female.png",
                                  height: iconSize,
                                  width: iconSize,
                                ),
                              ],
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //ROW1
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //RegNo
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "RegNo:",
                                              style: TextStyle(color: textFieldClr),
                                            ),
                                            Text(
                                              module.get("RegNo").toString(),
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //PatName
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "PatName:",
                                              style: TextStyle(color: textFieldClr),
                                            ),
                                            Text(
                                              module.get("PatName").toString(),
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //doctorname
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "doctorname:",
                                              style: TextStyle(color: textFieldClr),
                                            ),
                                            Text(
                                              module
                                                  .get("doctorname")
                                                  .toString(),
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  //ROW2
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      //Age
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Age:",
                                              style: TextStyle(color: textFieldClr),
                                            ),
                                            Text(
                                              module.get("Age").toString(),
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //sex
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "sex:",
                                              style: TextStyle(color: textFieldClr),
                                            ),
                                            Text(
                                              module.get("sex").toString(),
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //batch
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "batch:",
                                              style: TextStyle(color: textFieldClr),
                                            ),
                                            Text(
                                              module.get("batch").toString(),
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            );
          }),
    );
  }
}

getJson() {
  return [
    {
      "RegNo": "1",
      "PatName": "Mr.Devilaal",
      "doctorname": "Dr.Ram",
      "Age": "26 Y",
      "sex": "MALE",
      "batch": "Batch 1"
    },
    {
      "RegNo": "2",
      "PatName": "Mr.Damodara",
      "doctorname": "Dr.John",
      "Age": "36 Y",
      "sex": "MALE",
      "batch": "Batch 2"
    },
    {
      "RegNo": "3",
      "PatName": "Mr.Daler",
      "doctorname": "Dr.Jenny",
      "Age": "36 Y",
      "sex": "MALE",
      "batch": "Batch 3"
    },
    {
      "RegNo": "4",
      "PatName": "Dr.Bhagat",
      "doctorname": "Dr.Ram",
      "Age": "36 Y",
      "sex": "MALE",
      "batch": "Batch 4"
    },
    {
      "RegNo": "5",
      "PatName": "Mr.Bansi",
      "doctorname": "Dr.John",
      "Age": "37 Y",
      "sex": "MALE",
      "batch": "Batch 1"
    },
    {
      "RegNo": "6",
      "PatName": "Mr.Balwant",
      "doctorname": "Dr.Jenny",
      "Age": "26 Y",
      "sex": "MALE",
      "batch": "Batch 2"
    },
    {
      "RegNo": "7",
      "PatName": "Mr.Balvinder",
      "doctorname": "Dr.Ram",
      "Age": "26 Y",
      "sex": "MALE",
      "batch": "Batch 3"
    },
    {
      "RegNo": "8",
      "PatName": "Mr.Abhay",
      "doctorname": "Dr.Sam",
      "Age": "26 Y",
      "sex": "MALE",
      "batch": "Batch 4"
    },
    {
      "RegNo": "9",
      "PatName": "Mr.Dev",
      "doctorname": "Dr.Sam",
      "Age": "36 Y",
      "sex": "MALE",
      "batch": "Batch 1"
    },
    {
      "RegNo": "10",
      "PatName": "Mr.Bani",
      "doctorname": "Dr.Ram",
      "Age": "39 Y",
      "sex": "FEMALE",
      "batch": "Batch 2"
    },
    {
      "RegNo": "11",
      "PatName": "Mr.DON",
      "doctorname": "Dr.John",
      "Age": "30 Y",
      "sex": "MALE",
      "batch": "Batch 3"
    },
    {
      "RegNo": "12",
      "PatName": "Dr.Par",
      "doctorname": "Dr.Sam",
      "Age": "20 Y",
      "sex": "MALE",
      "batch": "Batch 4"
    },
    {
      "RegNo": "13",
      "PatName": "Mr.BAN",
      "doctorname": "Dr.John",
      "Age": "60 Y",
      "sex": "MALE",
      "batch": "Batch 1"
    },
    {
      "RegNo": "14",
      "PatName": "Mr.pal",
      "doctorname": "Dr.Jenny",
      "Age": "60 Y",
      "sex": "FEMALE",
      "batch": "Batch 2"
    },
    {
      "RegNo": "15",
      "PatName": "Mr.MAN",
      "doctorname": "Dr.John",
      "Age": "20 Y",
      "sex": "MALE",
      "batch": "Batch 3"
    },
    {
      "RegNo": "16",
      "PatName": "Mr.ABI",
      "doctorname": "Dr.John",
      "Age": "18 Y",
      "sex": "MALE",
      "batch": "Batch 4"
    },
    ////
  ];
}
