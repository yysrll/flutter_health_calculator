import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalkulator_sehat/calculator_screen.dart';

var primaryColor = Color(0xFF6C63FF);
var primaryButtonColor = Color(0xB36C63FF);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
            Container(
              padding: EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: primaryButtonColor,
                    padding: EdgeInsets.all(12.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      'images/ic_calori.png',
                      height: 48.0,
                    ),
                    Text(
                      'Calorie Calculator',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Image.asset(
                      'images/ic_arrow.png',
                      height: 16.0,
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 24.0, left: 24.0, bottom: 24.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CalculatorScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                    primary: primaryButtonColor,
                    padding: EdgeInsets.all(12.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      'images/ic_weight.png',
                      height: 48.0,
                    ),
                    Text(
                      'BMI Calculator',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Image.asset(
                      'images/ic_arrow.png',
                      height: 16.0,
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(24.0),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Any problem? Contact Developer',
                    style: TextStyle(color: primaryColor),
                  )),
            )
          ],
        )),
      ),
    );
  }
}
