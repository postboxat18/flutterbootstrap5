import 'package:example/Home/utils/UtilsWidgets.dart';
import 'package:flutter/material.dart';

import 'package:flutterbootstrap5latest/flutterbootstrap5latest.dart';

import '../../../Utils/ColorFile.dart';

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
                  border: Border.all(color: primary)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Menu Field $i",
                  style: TextStyle(color: primary),
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
      classNames: 'row-cols-1 m-4',
      children: [
        FB5Col(
          classNames: 'col-2',
          child: FB5Row(
            children: [
              FB5Col(
                child: Text(
                  "Text",
                  style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                ),
              ),
              FB5Col(
                child: Text(
                  "Fields",
                  style:
                      TextStyle(color: primary1, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        FB5Col(
          classNames: 'm-t-5',
          child: Card(
            child: FB5Row(
              classNames: 'row-cols-xs-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-4 row-cols-xl-8 row-cols-xxl-8 justify-content-start align-self-center m-2',
              children: [
                //TITLE
                FB5Col(
                  classNames: 'col-md-2 col-lg-2 col-xl-1 col-xxl-1 m-2',
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(color: textFieldClr),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Mr",
                          labelStyle: TextStyle(color: textFieldClr),
                          suffixIcon: Icon(Icons.arrow_drop_down_rounded),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: textFieldClr)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textFieldClr)),
                        ),
                      ),
                    ],
                  ),
                ),
                //First NAME
                FB5Col(
                  classNames: 'col-md-3 col-lg-3 col-xl-2 col-xxl-2 m-2',
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "First Name",
                        style: TextStyle(color: textFieldClr),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "First Name",
                          labelStyle: TextStyle(color: textFieldClr),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: textFieldClr)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textFieldClr)),
                        ),
                      ),
                    ],
                  ),
                ),
                //SECOND NAME
                FB5Col(
                  classNames: 'col-md-3 col-lg-3 col-xl-2 col-xxl-2 m-2',
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Second Name",
                        style: TextStyle(color: textFieldClr),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Second Name",
                          labelStyle: TextStyle(color: textFieldClr),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: textFieldClr)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textFieldClr)),
                        ),
                      ),
                    ],
                  ),
                ),
                //SEX
                FB5Col(
                  classNames: 'col-md-3 col-lg-3 col-xl-2 col-xxl-2 m-2',
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sex",
                        style: TextStyle(color: textFieldClr),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.arrow_drop_down_rounded),
                          labelText: "Sex",
                          labelStyle: TextStyle(color: textFieldClr),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: textFieldClr)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textFieldClr)),
                        ),
                      ),
                    ],
                  ),
                ),
                //ADD 1
                FB5Col(
                  classNames: 'col-md-5 col-lg-5 col-xl-5 col-xxl-5 m-2',
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address 1",
                        style: TextStyle(color: textFieldClr),
                      ),
                      TextFormField(
                        maxLines: 5,

                        decoration: InputDecoration(
                          labelText: "Address 1",
                          labelStyle: TextStyle(color: textFieldClr),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: textFieldClr)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textFieldClr)),
                        ),
                      ),
                    ],
                  ),
                ), //ADD 2
                FB5Col(
                  classNames: 'col-md-5 col-lg-5 col-xl-5 col-xxl-5  m-2',
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address 2",
                        style: TextStyle(color: textFieldClr),
                      ),
                      TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: "Address 2",
                          labelStyle: TextStyle(color: textFieldClr),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: textFieldClr)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textFieldClr)),
                        ),
                      ),
                    ],
                  ),
                ),
                //pin code
                FB5Col(
                  classNames: 'col-md-2 col-lg-2 col-xl-2 col-xxl-2 m-2',
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pin Code",
                        style: TextStyle(color: textFieldClr),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Pin Code",
                          labelStyle: TextStyle(color: textFieldClr),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: textFieldClr)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textFieldClr)),
                        ),
                      ),
                    ],
                  ),
                ),
                //BTN
                FB5Col(
                  classNames: 'col-md-5 col-lg-5 col-xl-5 col-xxl-5 m-2',
                  child: FB5Row(
                    classNames: 'mt-3 justify-content-center',
                    children: [
                      FB5Col(
                        child: Text(
                          "Pin Code",
                          style: TextStyle(color: Colors.transparent),
                        ),
                      ),
                      FB5Col(
                        classNames: 'col-7 justify-content-center',
                        child: InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: gradientFunc(),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  "Submit",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
