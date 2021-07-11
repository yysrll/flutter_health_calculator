import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var primaryColor = Color(0xFF6C63FF);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
            child: Text(
              'Welcome to',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Health ',
                      style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Calculator ',
                      style: TextStyle(fontSize: 28.0, color: primaryColor),
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(
                left: 24.0, top: 60.0, right: 24.0, bottom: 24.0),
            child: Image.asset('images/hero.png'),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                  'has a health calculator feature that can help you maintain a good body health. You can use all these features easily and for free')),
        ],
      )),
    );
  }
}