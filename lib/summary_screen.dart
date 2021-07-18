import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalkulator_sehat/calculator_screen.dart';

var primaryColor = Color(0xFF6C63FF);
var secondaryColor = Color(0x336C63FF);
var primaryButtonColor = Color(0xB36C63FF);

class SummaryScreen extends StatelessWidget {
  SummaryScreen(ResultData resultData);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: Text(
            'Your summary',
            style: TextStyle(fontSize: 28.0, color: primaryColor),
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Text('Your BMI is'),
                        Text(
                          result.toStringAsFixed(1),
                          style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                        Text('Your weight is normal')
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(24.0)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text(
                    'Healthy BMI range : 18.5 - 25 \nHealthy weight for the height : 47 kg - 64 kg',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: primaryColor),
                  ),
                ),
                Text(
                    'The calculation results show that you are underweight or classified as thin. This result is based on your BMI figure that is below 18.5. As a solution, you need an additional calorie intake of 300-500 kcal per day. Also improve your diet and lifestyle to get the ideal body weight. \n\nCheck your daily calorie needs by using the Calorie Calculator feature. \n\nThe calculation results show that you have a normal weight. This result is based on your BMI, which is between 18.5 and 24.9. Having an ideal body weight can be one way to maintain overall body health. You can also avoid various risks of dangerous diseases. \n\nHow to maintain an ideal body weight is to adjust your diet and do regular exercise. In essence, you must continue to live a healthy lifestyle. Make sure to always balance the energy in and the energy out.'),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: ElevatedButton(
                              onPressed: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) {
                                //   return SummaryScreen();
                                // }));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: primaryButtonColor,
                                  padding: EdgeInsets.all(12.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(24.0))),
                              child: Text(
                                'Try again',
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: OutlinedButton(
                              onPressed: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) {
                                //   return SummaryScreen();
                                // }));
                              },
                              style: OutlinedButton.styleFrom(
                                  primary: primaryButtonColor,
                                  padding: EdgeInsets.all(12.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(24.0))),
                              child: Text(
                                'Back to home',
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
