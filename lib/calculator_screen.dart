import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var primaryColor = Color(0xFF6C63FF);
var secondaryColor = Color(0x336C63FF);
var primaryButtonColor = Color(0xB36C63FF);

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: Row(
            children: <Widget>[
              Text(
                'BMI ',
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
                  child: Text(
                      'A calorie calculator is a tool used to find out how many calories a person needs. The calculation results can be used as a reference to control calorie intake per day.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 12.0),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(24.0))),
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
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 12.0),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: secondaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(24.0))),
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
                              'Male',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
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
                Padding(
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DropdownWidget(),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                        onPressed: () {},
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
                              'BMI',
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
