import 'package:Project/StudentProfile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  Widget _rowWidget() {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.87,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Company Name",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Schyler',
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Eligibility: Yes",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Schyler',
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Date: December 7, 2020",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Schyler',
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "CTC: 8.6 LPA",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Schyler',
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: 'Schyler',
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(
              children: <Widget>[
                CupertinoButton(
                  child: _rowWidget(),
                  onPressed: () {
                    //Code to redirect to particular link provided by admin
                  },
                ),
                CupertinoButton(
                  child: _rowWidget(),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
