import 'package:Project/AdminCreateCompany.dart';
import 'package:Project/listOfCompany.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavigationAdmin extends StatefulWidget {
  @override
  _NavigationAdminState createState() => _NavigationAdminState();
}

class _NavigationAdminState extends State<NavigationAdmin> {
  int pageIndex = 0;
  final AdminCreateCompany _profile = AdminCreateCompany();
  final AdminDashboard _dashboard = AdminDashboard();

  Widget _showPage = new AdminDashboard();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _dashboard;
        break;
      case 1:
        return _profile;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text("No data found by page chooser"),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        backgroundColor: Colors.white,
        color: Colors.green,
        items: <Widget>[
          Icon(
            Icons.dashboard,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.create,
            size: 30,
            color: Colors.white,
          ),
        ],
        animationDuration: Duration(
          milliseconds: 400,
        ),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
      body: Container(
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
