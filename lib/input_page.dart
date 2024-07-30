import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proj3/Functions.dart';
import 'package:proj3/calculator_brain.dart';
import 'constants.dart';
import 'result_page.dart';

class input_page extends StatefulWidget {
  @override
  State<input_page> createState() => _input_pageState();
}

class _input_pageState extends State<input_page> {
  int height = 180;
  int weight = 60;
  int age = 10;

  ColorManage colorManage = ColorManage(active: inactive);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF041a3e),
        title: Text(
          "BMI Calculator",
          style: textstyle1,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        print("male card");
                        setState(() {
                          colorManage.updateColor(Gender.male);
                        });
                      },
                      child: ContainerWedg(
                          color1: colorManage.male,
                          childcard: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.mars,
                                size: 80,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF8D8E98)),
                              )
                            ],
                          )))),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    colorManage.updateColor(Gender.female);
                  });
                },
                child: ContainerWedg(
                  color1: colorManage.female,
                  childcard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.venus,
                        size: 80,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "female",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
                      )
                    ],
                  ),
                ),
              ))
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ContainerWedg(
                color1: inactive,
                col: 400,
                childcard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("180"), Text("cm")],
                    ),
                    SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30)),
                        child: Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 250,
                          onChanged: (double value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                        )),
                  ],
                ),
              ))
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ContainerWedg(
                color1: inactive,
                childcard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Weight", style: textstyle1),
                    Text(
                      weight.toString(),
                      style: textstyle,
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: Icon(FontAwesomeIcons.plus)),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Icon(FontAwesomeIcons.minus))
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: ContainerWedg(
                color1: inactive,
                childcard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Age",
                      style: textstyle1,
                    ),
                    Text(
                      age.toString(),
                      style: textstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: Icon(FontAwesomeIcons.plus)),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: Icon(FontAwesomeIcons.minus))
                      ],
                    )
                  ],
                ),
              ))
            ],
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.red,
                height: 50,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => result_page(),
                          ));
                    },
                    child: Center(
                        child: GestureDetector(
                      child: Text(
                        "Calculate",
                        style: textstyle1,
                      ),
                      onTap: () {
                        CalculatorBrain calc =
                            CalculatorBrain(height: height, weight: weight);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => result_page(
                                      bmiResult: calc.calculateBMI(),
                                      resultText: calc.getResult(),
                                      interpretation: calc.getInterpretation(),
                                    )));
                      },
                    ))),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ContainerWedg extends StatelessWidget {
  ContainerWedg(
      {this.col = 200, required this.childcard, required this.color1});
  double col;
  final Widget childcard;
  final Color color1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            height: col,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: color1),
            child: childcard));
  }
}
