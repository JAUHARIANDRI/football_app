import 'package:flutter/material.dart';

import 'package:football_app/src/utils/values/colors.dart';

class TextFieldCustom {
  static searchBar(_hintText, Function fun) {
    return InputDecoration(
      hintText: _hintText,
      suffixIcon: InkWell(
        child: Icon(
          Icons.search,
          color: kGrayColor,
          // color: materialPurple,
        ),
        onTap: fun,
      ),
      fillColor: filledColorTextfield,
      filled: true,
      contentPadding: EdgeInsets.all(8.0),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: colorBlack, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: materialLightGrey, width: 1.0),
      ),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: accentColor, width: 0.0),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
