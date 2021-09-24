import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:football_app/src/pages/dashboard/dashboard_navigation.dart';
import 'package:football_app/src/utils/values/themes.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: customTheme,
      home: splashScreens(),
    );
  }
}

class splashScreens extends StatefulWidget {
  @override
  splashScreensState createState() => splashScreensState();
}

class splashScreensState extends State<splashScreens> {
  @override
  void initState() {
    super.initState();
    getPref();
  }

  getPref() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => DashboardNavigation()),
          (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: splashscreen(),
    );
  }

  Widget splashscreen() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black54,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              EvaIcons.archive,
              size: 60,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "League Football",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
