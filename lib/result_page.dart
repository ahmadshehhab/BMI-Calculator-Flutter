import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proj3/constants.dart';
import 'package:proj3/input_page.dart';


class result_page extends StatelessWidget {
  result_page({@required this.bmiResult , @required this.resultText , @required this.interpretation});
  final String ?bmiResult;
  final String ?resultText;
  final String ?interpretation;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Result Page" ,style: textstyle1,),),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(FontAwesomeIcons.backward ,color: Colors.white,),
          ),
          backgroundColor: Colors.blueGrey[900],

        ),
        body: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: Container(child: Text("Your Result is " , style: textstyle,),)),
              Expanded(
                  child: ContainerWedg(color1: Colors.blueGrey,col: 700,childcard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText!.toString() ,style: textstyle1,),
                  Text(bmiResult!.toString(),style: textstyle1,),
                  Text(interpretation.toString())
                ],
              ),))
            ],
          ),
        ),

      ),
    );
  }
}
