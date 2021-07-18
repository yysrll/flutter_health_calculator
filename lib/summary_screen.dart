import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalkulator_sehat/calculator_screen.dart';
import 'package:kalkulator_sehat/home_screen.dart';

var primaryColor = Color(0xFF6C63FF);
var secondaryColor = Color(0x336C63FF);
var primaryButtonColor = Color(0xB36C63FF);

var upText;
var downText;
var titleDescription;
var description;
var bmi;
var weightStatus;

class SummaryScreen extends StatelessWidget {
  final ResultData resultData;
  SummaryScreen(this.resultData);

  @override
  Widget build(BuildContext context) {
    if (resultData.code == 0) {
      upText = 'You need';
      downText = 'Calories per day';
      titleDescription = 'Attention!';
      description =
          'Calorie Calculator calculation results only contain information about the estimated calorie intake that you must meet every day. The results are obtained according to the information you entered. Always consult a medical professional to get more accurate results, health information, and the right medical action.';
    } else {
      upText = 'Your BMI is';
      titleDescription = 'Healthy BMI range : 18.5 - 25';
      bmi = resultData.result;
      if (bmi <= 18.5) {
        weightStatus = 'Thin';
        description =
            'The calculation results show that you are underweight or classified as thin. This result is based on your BMI figure that is below 18.5. As a solution, you need an additional calorie intake of 300-500 kcal per day. Also improve your diet and lifestyle to get the ideal body weight.';
      } else if (25 > bmi && bmi > 18.5) {
        weightStatus = 'Normal';
        description =
            'The calculation results show that you have a normal weight. This result is based on your BMI, which is between 18.5 and 24.9. Having an ideal body weight can be one way to maintain overall body health. You can also avoid various risks of dangerous diseases. \n\nHow to maintain an ideal body weight is to adjust your diet and do regular exercise. In essence, you must continue to live a healthy lifestyle. Make sure to always balance the energy in and the energy out.';
      } else if (30 > bmi && bmi >= 25) {
        weightStatus = 'Fat';
        description =
            'The calculation results show that you are overweight or obese. This result is based on your BMI, which is between 25 and 29.9. As a solution, you should reduce your daily calorie intake by around 300-500 kcal. From now on try to pay more attention to the calories from the food and drinks you consume. \n\nReducing your daily calorie intake by about 500 kcal can help you lose 0.5-1 kg of weight per week. Not only reducing calorie intake, weight loss can be achieved with regular exercise. Keep in mind that do not consume calories below 1,200 kcal per day because it can have a bad impact on health.';
      } else {
        weightStatus = 'Obesity';
        description =
            'The calculation results show that you are classified as obese. These results are based on your BMI number over 30. Please note that obesity is more severe than obesity. Someone who is fat is not necessarily obese, while someone who is obese is definitely fat. If left unchecked, can be at risk of suffering from various serious diseases. \n\nHow to lose weight is to reduce your daily calorie intake by about 300-500 kcal. This method can help you lose weight by 0.5-1 kg per week. Reducing calorie intake alone is not enough. You need to do regular exercise to get the ideal body weight.';
      }

      downText = 'Your weight is ' + weightStatus;
    }

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
                        Text(upText),
                        Text(
                          resultData.result.toStringAsFixed(1),
                          style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                        Text(downText)
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
                    titleDescription,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: primaryColor),
                  ),
                ),
                Text(description),
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
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CalculatorScreen(resultData.code);
                                }));
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
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomeScreen();
                                }));
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
