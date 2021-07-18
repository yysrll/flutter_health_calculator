import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalkulator_sehat/summary_screen.dart';

var primaryColor = Color(0xFF6C63FF);
var secondaryColor = Color(0x336C63FF);
var primaryButtonColor = Color(0xB36C63FF);

var title;
var description;
var isVisible;
// var isMale = true;

class CalculatorScreen extends StatelessWidget {
  final int code;
  CalculatorScreen(this.code);

  @override
  Widget build(BuildContext context) {
    if (code == 0) {
      title = 'Calorie ';
      description =
          'A calorie calculator is a tool used to find out how many calories a person needs. The calculation results can be used as a reference to control calorie intake per day.';
      isVisible = true;
    } else {
      title = 'BMI ';
      description =
          'The BMI calculator can provide information whether your weight is ideal or normal, underweight, overweight, or obese. Calculate Body Mass Index (BM) or Body Mass Index (BMI) simply by entering height and weight data.';
      isVisible = false;
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: Row(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              Text(
                'Calculator ',
                style: TextStyle(fontSize: 28.0, color: primaryColor),
              ),
            ],
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(description),
                ),
                PickGender(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    initialValue: '0',
                    decoration: InputDecoration(
                        labelText: 'Weight (kg)',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    initialValue: '0',
                    decoration: InputDecoration(
                        labelText: 'Height (cm)',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)))),
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      initialValue: '0',
                      decoration: InputDecoration(
                          labelText: 'Age (years)',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24.0)))),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DropdownWidget(),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SummaryScreen();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: primaryButtonColor,
                            padding: EdgeInsets.all(12.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Calculate your ',
                            ),
                            Text(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({Key? key}) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

/// This is the private State class that goes with DropdownWidget.
class _DropdownWidgetState extends State<DropdownWidget> {
  String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        isExpanded: true,
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 18.0,
        // style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
            labelText: 'Physical activity level',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.0)))),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: [
          DropdownMenuItem<String>(
            child: Text('Never/very rarely exercise'),
            value: '1',
          ),
          DropdownMenuItem<String>(
            child: Text('Infrequent exercise (1-3 days a week)'),
            value: '2',
          ),
          DropdownMenuItem<String>(
            child: Text('Exercising frequently (3-5 days a week)'),
            value: '3',
          ),
          DropdownMenuItem<String>(
            child: Text('Exercise frequently (6-7 days a week)'),
            value: '4',
          ),
          DropdownMenuItem<String>(
            child: Text('Very often do sports or do physical work everyday'),
            value: '5',
          ),
        ]);
  }
}

class PickGender extends StatefulWidget {
  @override
  _PickGender createState() => _PickGender();
}

class _PickGender extends State<PickGender> {
  bool _isMale = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 12.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isMale = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: (_isMale ? primaryColor : secondaryColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Image.asset(
                      'images/ic_man.png',
                      height: 100.0,
                    ),
                  )),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Male',
                  style: TextStyle(
                    fontWeight: (_isMale ? FontWeight.bold : FontWeight.normal),
                  ),
                ))
          ],
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 12.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isMale = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: (_isMale ? secondaryColor : primaryColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Image.asset(
                      'images/ic_woman.png',
                      height: 100.0,
                    ),
                  )),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Female',
                  style: TextStyle(
                    fontWeight: (_isMale ? FontWeight.normal : FontWeight.bold),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
