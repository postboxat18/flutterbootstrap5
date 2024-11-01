library flutter_bootstrap5;

import 'package:flutter/material.dart';
import 'package:flutterbootstrap5latest/flutterbootstrap5latest.dart';

import '../Home/Home.dart';
import '../Home/utils/UtilsWidgets.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    String data = getData(width);
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration:BoxDecoration(
            gradient: gradientFunc()
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: data == "xs" || data == "sm"
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.end,
          children: [
            FB5Row(
              classNames:
                  'justify-content-xs-center justify-content-sm-center justify-content-md-end justify-content-lg-end justify-content-xl-end justify-content-xxl-end',
              children: [
                FB5Col(
                  classNames:
                      'col-xs-12 col-sm-12 col-md-3 m-5 col-lg-3 col-xl-3 col-xxl-3',
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.zero,
                    child: FB5Row(
                      children: [
                        ///Login text
                        FB5Col(
                          classNames: 'm-2',
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        FB5Col(
                          classNames: 'm-2',
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                              ),
                              labelText: "Email",
                              // errorText: "Please enter the username",
                              labelStyle: TextStyle(),
                            ),
                          ),
                        ),
                        FB5Col(
                          classNames: 'm-2',
                          child: TextField(
                              decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(),
                            //  errorText: "Please enter the password",
                          )),
                        ),

                        FB5Col(
                          classNames: 'm-2',
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Login",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                )),
                          ),
                        ),

                        FB5Col(
                          child: FB5Row(
                            classNames: 'justify-content-between',
                            children: [
                              ///Forgot Username button
                              FB5Col(
                                child: TextButton(
                                  onPressed: () {
                                    print("forgot username clicked");
                                  },
                                  child: Text(
                                    "Forgot Username?",
                                    style: TextStyle(),
                                  ),
                                ),
                              ),

                              ///Forgot Password button
                              FB5Col(
                                child: TextButton(
                                  onPressed: () {
                                    print("forgot password clicked");
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  String getData(double width) {
    String data = "";

    if (width >= 0 && width <= 576) {
      data = "xs";
    } else if (width >= 576 && width <= 768) {
      data = "sm";
    } else if (width >= 768 && width <= 992) {
      data = "md";
    } else if (width >= 992 && width <= 1200) {
      data = "lg";
    } else if (width >= 1200 && width <= 1400) {
      data = "xl";
    } else if (width >= 1400 && width <= double.infinity) {
      data = "xxl";
    }
    return data;
  }
}
