import 'package:flutter/material.dart';

import 'editStudentDetail.dart';

class StudentProfile extends StatefulWidget {
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  Widget _buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Text(
            "Yashul Agrawal",
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildRollNo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Roll Number',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Text(
            "170020",
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildClassX() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Class X',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Text(
            "84.6",
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildClassXII() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Class XII',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Text(
            "74.7",
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildGrad() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Graduation',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Text(
            "8.5",
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildCourse() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Course',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Text(
            "B.Tech CS-SD",
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Schyler',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: 'Schyler',
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 40.0,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildName(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildRollNo(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildClassX(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildClassXII(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildGrad(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildCourse(),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditDetails()),
          );
        },
        child: Icon(Icons.edit),
        backgroundColor: Colors.green[900],
      ),
    );
  }
}
