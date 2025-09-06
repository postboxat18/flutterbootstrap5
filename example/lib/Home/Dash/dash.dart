import 'package:example/Home/utils/UtilsWidgets.dart';
import 'package:example/Utils/ColorFile.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutterbootstrap5latest/flutterbootstrap5latest.dart';
import '../Alert/AlertUI.dart';
import '../Table/TableModule.dart';
import 'Model/ChartData.dart';
import 'Model/SalesData.dart';

class Dash extends StatefulWidget {
  const Dash({super.key});

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  late List<String> topHeaderList = [
    "Top Harder 1",
    "Top Harder 2",
    "Top Harder 3",
    "Top Harder 4",
    "Top Harder 5",
    "Top Harder 6",
    "Top Harder 7",
  ];
  final List<ChartData> chartData = [
    ChartData(1924, 90, '100%', Colors.blue),
    ChartData(1925, 50, '100%', Colors.green),
    ChartData(1926, 70, '100%', Colors.red),
  ];
  late double width;

  @override
  Widget build(BuildContext context) {
    int n = topHeaderList.length;
    width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          //TOP TITLE
          FB5Row(
            classNames: 'row-cols-2 align-items-center justify-content-between',
            children: [
              //TITLE
              FB5Col(
                classNames: 'col-1 align-self-start',
                child: FB5Row(
                  classNames: 'justify-content-start',
                  children: [
                    FB5Col(
                      child: Text(
                        "Dash",
                        style: TextStyle(
                            color: primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FB5Col(
                      child: Text(
                        "Board",
                        style: TextStyle(
                            color: primary1,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              FB5Col(
                classNames: 'col-3',
                child: FB5Row(
                  classNames: 'align-items-center justify-content-between',
                  children: [
                    //SEARCH
                    FB5Col(
                      classNames: 'col-8',
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: bgClr,
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: textFieldClr,
                          ),
                          labelText: "Search Here",
                          labelStyle: TextStyle(color: textFieldClr),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: borderClr)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: borderClr)),
                        ),
                      ),
                    ),
                    //NOTIFY
                    FB5Col(
                      classNames: 'col-1',
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Icon(
                              Icons.notifications_none_outlined,
                              color: textFieldClr,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            decoration: BoxDecoration(
                                color: primary1, shape: BoxShape.circle),
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Text(
                                "2",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    //SETTINGS
                    FB5Col(
                      classNames: 'col-1',
                      child: Icon(
                        Icons.settings,
                        color: textFieldClr,
                      ),
                    ),
                    //LOGOUT
                    FB5Col(
                      classNames: 'col-1',
                      child: Icon(
                        Icons.login_outlined,
                        color: textFieldClr,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                //HEADER
                FB5Row(
                  classNames:
                      'ms-2 justify-content-xs-center justify-content-sm-center justify-content-md-start justify-content-lg-start justify-content-xl-start justify-content-xxl-start',
                  children: [
                    //HEADER
                    ...topHeaderList.map((header) => FB5Col(
                          classNames:
                              'col-xs-4 col-sm-4 col-md-4 col-lg-3 col-xl-3 col-xxl-3 justify-content-xs-center justify-content-sm-center justify-content-md-start justify-content-lg-start justify-content-xl-start justify-content-xxl-start',
                          child: gridView(header),
                        ))
                  ],
                ),
                //CHART
                FB5Row(
                    classNames: 'row-cols-1 justify-content-center',
                    children: [
                      FB5Col(
                        classNames: 'm-2',
                        child: Card(
                          child: SfCartesianChart(
                              // Chart title
                              title: ChartTitle(
                                  text: 'Half yearly sales analysis',
                                  textStyle: TextStyle(
                                      color: primary,
                                      fontWeight: FontWeight.bold)),
                              // Enable legend
                              primaryXAxis: CategoryAxis(),
                              legend: Legend(isVisible: true),
                              series: <SplineAreaSeries<SalesData, String>>[
                                SplineAreaSeries<SalesData, String>(
                                    dataSource: <SalesData>[
                                      SalesData('Jan', 35),
                                      SalesData('Feb', 28),
                                      SalesData('Mar', 34),
                                      SalesData('Apr', 32),
                                      SalesData('May', 40)
                                    ],
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales,
                                    // Enable data label
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true)),
                                SplineAreaSeries<SalesData, String>(
                                    dataSource: <SalesData>[
                                      SalesData('Jan', 35),
                                      SalesData('Feb', 23),
                                      SalesData('Mar', 24),
                                      SalesData('Apr', 20),
                                      SalesData('May', 45)
                                    ],
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales,
                                    // Enable data label
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true)),
                                SplineAreaSeries<SalesData, String>(
                                    dataSource: <SalesData>[
                                      SalesData('Jan', 20),
                                      SalesData('Feb', 18),
                                      SalesData('Mar', 8),
                                      SalesData('Apr', 12),
                                      SalesData('May', 27)
                                    ],
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales,
                                    // Enable data label
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true)),
                              ]),
                        ),
                      ),
                    ]),
                //ROW CHART
                FB5Row(
                    classNames:
                        'row-cols-xs-1 row-cols-sm-1 row-cols-lg-2 row-cols-xl-2 row-cols-xxl-2 justify-content-between m-2',
                    children: [
                      FB5Col(
                        child: Card(
                          child: SfCartesianChart(
                              // Chart title
                              title: ChartTitle(
                                  text: 'Half yearly sales analysis',
                                  textStyle: TextStyle(
                                      color: primary,
                                      fontWeight: FontWeight.bold)),
                              // Enable legend
                              primaryXAxis: CategoryAxis(),
                              legend: Legend(isVisible: true),
                              series: <ColumnSeries<SalesData, String>>[
                                ColumnSeries<SalesData, String>(
                                    dataSource: <SalesData>[
                                      SalesData('Jan', 35),
                                      SalesData('Feb', 28),
                                      SalesData('Mar', 34),
                                      SalesData('Apr', 32),
                                      SalesData('May', 40)
                                    ],
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales,
                                    // Enable data label
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true)),
                                ColumnSeries<SalesData, String>(
                                    dataSource: <SalesData>[
                                      SalesData('Jan', 35),
                                      SalesData('Feb', 23),
                                      SalesData('Mar', 24),
                                      SalesData('Apr', 20),
                                      SalesData('May', 45)
                                    ],
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales,
                                    // Enable data label
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true)),
                                ColumnSeries<SalesData, String>(
                                    dataSource: <SalesData>[
                                      SalesData('Jan', 20),
                                      SalesData('Feb', 18),
                                      SalesData('Mar', 8),
                                      SalesData('Apr', 12),
                                      SalesData('May', 27)
                                    ],
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales,
                                    // Enable data label
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true)),
                              ]),
                        ),
                      ),
                      FB5Col(
                        child: Card(
                            child: SfCircularChart(
                                // Chart title
                                title: ChartTitle(
                                    text: 'Half yearly chart analysis',
                                    textStyle: TextStyle(
                                        color: primary,
                                        fontWeight: FontWeight.bold)),
                                legend: Legend(isVisible: true),
                                series: <RadialBarSeries<ChartData, int>>[
                              RadialBarSeries<ChartData, int>(
                                useSeriesColor: true,
                                trackOpacity: 0.3,
                                cornerStyle: CornerStyle.bothCurve,
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true),
                                dataSource: chartData,
                                pointRadiusMapper: (ChartData data, _) =>
                                    data.text,
                                pointColorMapper: (ChartData data, _) =>
                                    data.color,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y,
                              )
                            ])),
                      ),
                    ]),

                //TABLE
                FB5Row(
                  children: [
                    FB5Col(
                      child: TableModule(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  gridView(String header) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: FB5Row(
        children: [
          //HEADER
          FB5Col(
            classNames: 'p-2',
            child: Text(header,
                style: TextStyle(fontSize: 14, color: textFieldClr)),
          ),
          FB5Col(
            classNames: 'p-2',
            child: FB5Row(
              classNames: 'justify-content-between',
              children: [
                FB5Col(
                  classNames: 'p-2',
                  child: Text("22",
                      style: TextStyle(fontSize: 28, color: primary)),
                ),
                FB5Col(
                  classNames: 'p-2',
                  child: Container(
                    decoration: ShapeDecoration(shape: CircleBorder(),color: primary1),
                    padding: EdgeInsets.all(10),
                      child:
                          Icon(Icons.monetization_on_outlined, color: Colors.white)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
