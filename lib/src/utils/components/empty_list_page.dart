import 'package:flutter/material.dart';
import 'package:football_app/src/utils/values/dimens.dart';
import 'package:football_app/src/utils/values/strings.dart';

class EmptyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/empty.png',
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                SizedBox(height: marginMedium),
                Text(
                  Dictionary.warning_empty_list,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
