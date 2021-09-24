import 'package:flutter/material.dart';
import 'package:football_app/src/pages/Schedules/Schedules.dart';
import 'package:football_app/src/pages/dashboard/dashboard.dart';
import 'package:football_app/src/utils/components/custom_toast.dart';

class DashboardNavigation extends StatefulWidget {
  final int indexInitial;

  const DashboardNavigation({Key key, this.indexInitial}) : super(key: key);
  @override
  _DashboardNavigationState createState() => _DashboardNavigationState();
}

class _DashboardNavigationState extends State<DashboardNavigation> {
  int _selectedIndex = 0;

  final _layoutPage = [
    DashboardPage(),
    SchedulesPage(),
  ];
  @override
  @override
  void initState() {
    if (widget.indexInitial != null) {
      _selectedIndex = widget.indexInitial;
    }
    super.initState();
  }

  void _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  DateTime currentBackPressTime;
  Future<bool> doubleTapToExit() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ToastFlush.info(context: context, message: "Double tap");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: doubleTapToExit,
      child: Scaffold(
        body: _layoutPage.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.cyan[900],
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_football),
                title: Text('Football Club')),
            BottomNavigationBarItem(
                icon: Icon(Icons.schedule_outlined), title: Text('Schedule')),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onTabItem,
        ),
      ),
    );
  }
}
