import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ColorManage {
  Color male = inactive; // Replace with your default inactive color
  Color female = inactive; // Replace with your default inactive color
  ColorManage({required Color active});


  void updateColor(Gender selectedGender) {

    if (selectedGender == Gender.male) {
      if (male == inactive) {
        male = mainC;
        female = inactive;
        print("updated");
      } else {
        male = inactive;
      }
    } else if (selectedGender == Gender.female) {
      if (female == inactive) {
        female = mainC;
        male = inactive;
        print("updated");
      } else {
        female = inactive;
      }
    }

  }
}
/*

*/

