import 'package:flutter/material.dart';

import 'package:flutterbootstrap5latest/flutterbootstrap5latest.dart';

menuFields(context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        for (int i = 0; i < 20; i++) ...[
          FB5Col(
            classNames: 'm-2',
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.deepPurple)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Menu Field $i",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ),
          )
        ],
      ],
    ),
  );
}

textFields(context) {
  return SingleChildScrollView(
    child: FB5Row(
      classNames:
          'row-cols-xs-1 row-cols-sm-3 row-cols-md-4 row-cols-lg-6 row-cols-xl-7 row-cols-xxl-8',
      children: [
        for (int i = 0; i < 20; i++) ...[
          //FIELD 1
          FB5Col(
            classNames: 'm-2',
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Text Fields $i",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  ),
            ),
          ),
        ]
      ],
    ),
  );
}
