import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ToastFlush {
  static warning(
      {@required BuildContext context,
      @required String message,
      int timer = 3}) {
    Flushbar(
      title: "Warning",
      message: message,
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundColor: Colors.orange,
      duration: timer != null ? Duration(seconds: timer) : null,
      boxShadows: [
        BoxShadow(
          color: Colors.grey[600],
          offset: Offset(0.0, 1.0),
          blurRadius: 2.0,
        )
      ],
      margin: EdgeInsets.all(8),
      borderRadius: 8,
    )..show(context);
  }

  static success(
      {@required BuildContext context,
      @required String message,
      int timer = 3}) {
    Flushbar(
      title: "Success",
      message: message,
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundColor: Colors.green,
      duration: timer != null ? Duration(seconds: timer) : null,
      boxShadows: [
        BoxShadow(
          color: Colors.grey[600],
          offset: Offset(0.0, 1.0),
          blurRadius: 2.0,
        )
      ],
      margin: EdgeInsets.all(8),
      borderRadius: 8,
    )..show(context);
  }

  static error(
      {@required BuildContext context,
      @required String message,
      int timer = 3}) {
    Flushbar(
      title: "Oopss",
      message: message,
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundColor: Colors.redAccent,
      duration: timer != null ? Duration(seconds: timer) : null,
      boxShadows: [
        BoxShadow(
          color: Colors.grey[600],
          offset: Offset(0.0, 1.0),
          blurRadius: 2.0,
        )
      ],
      margin: EdgeInsets.all(8),
      borderRadius: 8,
    )..show(context);
  }

  static info(
      {@required BuildContext context,
      @required String message,
      int timer = 3}) {
    Flushbar(
      title: "Information",
      message: message,
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundColor: Colors.blueAccent,
      duration: timer != null ? Duration(seconds: timer) : null,
      boxShadows: [
        BoxShadow(
          color: Colors.grey[600],
          offset: Offset(0.0, 1.0),
          blurRadius: 2.0,
        )
      ],
      margin: EdgeInsets.all(8),
      borderRadius: 8,
    )..show(context);
  }
}
