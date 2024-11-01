import 'package:example/Home/utils/UtilsWidgets.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutterbootstrap5latest/flutterbootstrap5latest.dart';
import '../Alert/AlertUI.dart';
import '../Table/TableModule.dart';
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
  late double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          //SEARCH
          FB5Row(
            classNames: 'justify-content-end',
            children: [
              FB5Col(
                classNames:
                    'm-2 col-xs-12 col-sm-12 col-md-3 col-lg-3 col-xl-3 col-xxl-3 justify-content-xs-center justify-content-sm-center justify-content-md-end justify-content-lg-end justify-content-xl-end justify-content-xxl-end',
                child: const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Search Here",
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
              ),
            ],
          ),
          //TITLE
          FB5Row(
            classNames: 'ms-2 justify-content-between',
            children: [
              FB5Col(
                child: Text(
                  "DashBoard",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              //ALERT DIALOG
              FB5Col(child: AlertUI(),)
            ],
          ),

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
              classNames:
                  'justify-content-xs-center justify-content-sm-center justify-content-md-center justify-content-lg-around justify-content-xl-around justify-content-xxl-around',
              children: [
                FB5Col(
                  classNames:
                      'col-xs-12 col-sm-12 col-md-5 col-lg-5 col-xl-5 col-xxl-5 m-1',
                  child: Container(
                    color: Colors.white,
                    child: SfCartesianChart(
                        // Chart title
                        title: ChartTitle(text: 'Half yearly sales analysis'),
                        // Enable legend
                        primaryXAxis: CategoryAxis(),
                        legend: Legend(isVisible: true),
                        series: <LineSeries<SalesData, String>>[
                          LineSeries<SalesData, String>(
                              dataSource: <SalesData>[
                                SalesData('Jan', 35),
                                SalesData('Feb', 28),
                                SalesData('Mar', 34),
                                SalesData('Apr', 32),
                                SalesData('May', 40)
                              ],
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales,
                              // Enable data label
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true))
                        ]),
                  ),
                ),
                FB5Col(
                  classNames:
                      'col-xs-12 col-sm-12 col-md-5 col-lg-5 col-xl-5 col-xxl-5 m-1',
                  child: Container(
                    color: Colors.white,
                    child: SfCircularChart(
                        // Chart title
                        title: ChartTitle(text: 'Half yearly sales analysis'),
                        // Enable legend
                        legend: Legend(isVisible: true),
                        series: <PieSeries<SalesData, String>>[
                          PieSeries<SalesData, String>(
                              dataSource: <SalesData>[
                                SalesData('Jan', 35),
                                SalesData('Feb', 28),
                                SalesData('Mar', 34),
                                SalesData('Apr', 32),
                                SalesData('May', 40)
                              ],
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales,
                              // Enable data label
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true))
                        ]),
                  ),
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
    );
  }

  gridView(String header) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: gradientFunc()
      ),
      child: FB5Row(
        children: [
          //HEADER
          FB5Col(
            classNames: 'p-2',
            child: Text(header,
                style: TextStyle(fontSize: 14, color:Colors.white)),
          ),
          FB5Col(
            classNames: 'p-2',
            child: FB5Row(
              classNames: 'justify-content-between',
              children: [
                FB5Col(
                  classNames: 'p-2',
                  child: Icon(Icons.home_outlined, color:Colors.white),
                ),
                FB5Col(
                  classNames: 'p-2',
                  child: Text("22",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.deepPurple
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
