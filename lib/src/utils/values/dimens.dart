//BASE MARGINS
import 'package:flutter/material.dart';

const double marginBig = 32.0;
// const double marginMedium = 16.0;
const double marginMedium = 13.0;
const double marginSmall = 8.0;
const double marginMicro = 4.0;
const double marginNano = 2.0;

//FONTS
const double fontTextTitle = 22.0;
const double fontTextBig = 18.0;
const double fontTextSizeBig = 25.0;
const double fontText = 16.0;
const double fontTextSmall = 14.0;
const double fontTextMicroSmall = 12.0;
const double fontEditText = 14.0;
const double fontButton = 14.0;
const double fontTextHeadline = fontTextBig;
const double fontTextTitleCheckout = fontTextSizeBig;

//INSTANCE
const double marginActivity = marginMedium;
const double marginForm = marginSmall;

const int maxCharItemName = 15;
const int maxCharItemNameWaiting = 25;
const int maxCharDate = 10;
const int maxCharAddress = 14;
const int maxCharName = 13;
const int maxCharItemNameProfile = 1;
const int maxCharItemCategori = 7;

class SizeConfig {
  static getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static getWidth(context) {
    return MediaQuery.of(context).size.width;
  }
}
