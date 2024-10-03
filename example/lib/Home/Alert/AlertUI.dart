import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbootstrap5latest/flutterbootstrap5latest.dart';

class AlertUI extends StatefulWidget {
  const AlertUI({super.key});

  @override
  State<AlertUI> createState() => _MedUIState();
}

class _MedUIState extends State<AlertUI> {
  late double width;
  String textName =
      'col-xs-12 col-sm-5 col-md-5 col-lg-3 col-xl-2 col-xxl-2 m-2';


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        AppBar(
          leadingWidth: 25,
          leading: IconButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              icon: Icon(
                Icons.stop_circle,
                color: Colors.white,
              )),
          title: Text(
            "Alert",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    titlePadding: EdgeInsets.zero,
                    title: Container(
                      padding: EdgeInsets.all(15),
                      color: Colors.deepPurple,
                      child: Text(
                        'Alert',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    content: showAlertDialog(context));
              },
            );
          },
          child: Text('Show AlertDialog'),
        ),
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.6,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.9,
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      child: SingleChildScrollView(
        child: FB5Row(classNames: 'align-items-center', children: [
          FB5Col(
            child: FB5Row(
              classNames: 'g-2 align-items-center',
              children: [
                FB5Col(
                  child: IconButton(
                    icon: Icon(Icons.visibility_outlined),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ),
                FB5Col(
                  child: Transform.scale(
                    scale: 1,
                    child: Switch(
                        value: false,
                        onChanged: (value) {},
                        activeTrackColor: Colors.deepPurple,
                        activeColor: Colors.deepPurple,
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: Colors.deepPurple),
                  ),
                ),
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Field 1",
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Fields 2",
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Fields 3",
                        filled: true,
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Fields 4",
                        filled: true,
                        isDense: true,
                        suffixIcon: Icon(
                          Icons.refresh,
                          size: 20.0,
                          color: Colors
                              .deepOrangeAccent, // Set the color of the icon,
                        ),
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              //width: 1.5,

                              ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Fields",
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        suffixIcon: Icon(Icons.calendar_today_rounded),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  child: Text('CheckBox',
                      style: TextStyle(
                          decoration: TextDecoration.none, fontSize: 12)),
                ),
                FB5Col(
                  child: Checkbox(
                    value: false,
                    onChanged: (newValue) {},
                  ),
                ),
                FB5Col(
                  child: Text('Total Amount:',
                      style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.none,
                          fontSize: 15)),
                ),
                FB5Col(
                  child: Text('200',
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 15)),
                ),
                FB5Col(
                  child: ElevatedButton(
                    onPressed: () {
                      // Button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, // Background color
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add,
                        ),
                        // Iconace between icon and text
                        Text(
                          "ADD",
                          style: TextStyle(color: Colors.white),
                        ),
                        // Text
                      ],
                    ),
                  ),
                ),
                FB5Col(
                  child: ElevatedButton(
                    onPressed: () {
                      // Button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Background color
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.close,
                        ),
                        // Iconace between icon and text
                        Text(
                          "CANCEL",
                          style: TextStyle(color: Colors.white),
                        ),
                        // Text
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FB5Col(child: Divider()),
          FB5Col(
            child: FB5Row(
              classNames: 'align-items-center',
              children: [
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Fields",
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Fields',
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Fields",
                        filled: true,
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "A/B",
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Fields",
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Fields",
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Fields",
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Fields",
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Fields",
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  classNames: textName,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Fields",
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintStyle: TextStyle()),
                    onChanged: (value) {},
                  ),
                ),
                FB5Col(
                  child: ElevatedButton(
                    onPressed: () {
                      // Button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.deepOrangeAccent, // Background color
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add,
                        ),
                        // Iconace between icon and text
                        Text(
                          "ADD",
                          style: TextStyle(color: Colors.white),
                        ),
                        // Text
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FB5Col(
            child: Container(
              color: Colors.yellow[200],
              margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
              padding: EdgeInsets.all(15),
              child: FB5Row(
                classNames: 'g-2 align-items-center',
                children: [
                  FB5Col(
                    classNames: textName,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Fields",
                          filled: true,
                          isDense: true,
                          contentPadding: EdgeInsets.all(15),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6)),
                          hintStyle: TextStyle()),
                      onChanged: (value) {},
                    ),
                  ),
                  FB5Col(
                    classNames: textName,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Fields",
                          filled: true,
                          isDense: true,
                          contentPadding: EdgeInsets.all(15),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6)),
                          hintStyle: TextStyle()),
                      onChanged: (value) {},
                    ),
                  ),
                  //RADIO
                  FB5Col(
                    child: Radio(
                      value: false,
                      groupValue: 2,
                      onChanged: (value) {},
                    ),
                  ),
                  FB5Col(
                    child: Text(
                      "option",
                    ),
                  ), FB5Col(
                    child: Radio(
                      value: false,
                      groupValue: 2,
                      onChanged: (value) {},
                    ),
                  ),
                  FB5Col(
                    child: Text(
                      "option",
                    ),
                  ),
                  FB5Col(
                    child: Radio(
                      value: false,
                      groupValue: 2,
                      onChanged: (value) {},
                    ),
                  ),
                  FB5Col(
                    child: Text(
                      "option",
                    ),
                  ),
                  FB5Col(
                    child: Icon(Icons.compare_arrows, size: 25),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
