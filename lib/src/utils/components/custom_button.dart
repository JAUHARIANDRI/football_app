import 'package:flutter/material.dart';
import 'package:football_app/src/utils/values/colors.dart';

// Button with green color
class FlatButtonPrimary extends StatelessWidget {
  final String label;
  final Function onPress;

  const FlatButtonPrimary({Key key, this.label, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: primaryColor,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      // padding: EdgeInsets.all(18.0),
      padding: EdgeInsets.all(15.0),
      splashColor: primaryColorDark,
      onPressed: onPress,
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class FlatButtonPrimaryLitle extends StatelessWidget {
  final String label;
  final Function onPress;

  const FlatButtonPrimaryLitle({Key key, this.label, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: primaryColor,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      // padding: EdgeInsets.all(18.0),
      padding: EdgeInsets.all(1.0),
      splashColor: primaryColorDark,
      onPressed: onPress,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}

class FlatButtonPrimaryBlack extends StatelessWidget {
  final String label;
  final Function onPress;

  const FlatButtonPrimaryBlack({Key key, this.label, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Colors.black,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(18.0),
      splashColor: primaryColorDark,
      onPressed: onPress,
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }
}

// Button with red color
class FlatButtonNegative extends StatelessWidget {
  final String label;
  final Function onPress;

  const FlatButtonNegative({Key key, this.label, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: redWarning,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(18.0),
      splashColor: Colors.redAccent,
      onPressed: onPress,
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }
}

// Button with Download Link
class FlatButtonLink extends StatelessWidget {
  final String label;
  final Function onPress;

  const FlatButtonLink({Key key, this.label, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      textColor: Colors.blue,
      onPressed: onPress,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.file_download,
            color: Colors.blue,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Button with icon
class FlatButtonWithIcon extends StatelessWidget {
  final String label;
  final Function onPress;
  final IconData iconData;
  final Color customColor;

  const FlatButtonWithIcon(
      {Key key, this.label, this.onPress, this.iconData, this.customColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: customColor ?? primaryColor,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(18.0),
      splashColor: primaryColorDark,
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(iconData),
          SizedBox(width: 2),
          Text(
            label,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class FlatButtonKonfirmWithIcon extends StatelessWidget {
  final String label;
  final Function onPress;
  final IconData iconData;
  final Color customColor;

  const FlatButtonKonfirmWithIcon(
      {Key key, this.label, this.onPress, this.iconData, this.customColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      // color: customColor ?? primaryColor,
      color: customColor ?? filledColorTextfield,

      textColor: Colors.black,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: primaryColorDark,

      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            iconData,
            // color: CustomColors.kPrimaryColor,
            color: primaryColor,
          ),
          SizedBox(width: 1),
          Text(
            label,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
