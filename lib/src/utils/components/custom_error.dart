import 'package:flutter/material.dart';
import 'package:football_app/src/utils/components/custom_button.dart';
import 'package:football_app/src/utils/values/dimens.dart';
import 'package:football_app/src/utils/values/strings.dart';

class CustomError {
  static Widget errorPage(String errorMessage, Function fun) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          SizedBox(height: marginForm),
          FlatButtonWithIcon(
            iconData: Icons.refresh,
            label: Dictionary.reload,
            onPress: fun,
          )
        ],
      ),
    );
  }
}
