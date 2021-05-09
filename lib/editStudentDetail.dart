import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

class EditDetails extends StatefulWidget {
  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Name',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.person,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _buildRollNoTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Roll Number',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.note,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _buildCourseDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          height: 200.0,
          child: Material(
            elevation: 10.0,
            shadowColor: Colors.grey,
            child: DropDownField(
              controller: courseSelected,
              hintText: "Select Course",
              enabled: true,
              items: courses,
              onValueChanged: (value) {
                setState(() {
                  selectCity = value;
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _buildClass10Marks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Class 10 Percentage/CGPA',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.description,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _buildClass12Marks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Class 12 Percentage/CGPA',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.description,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _buildCollegeMarks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Overall College CGPA',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.description,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _submitBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () => print("Login"),
        elevation: 10,
        padding: EdgeInsets.all(15),
        color: Colors.green,
        child: Text(
          "Submit",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Schyler',
            fontSize: 20,
          ),
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
          "Edit Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: 'Schyler',
          ),
        ),
        backgroundColor: Colors.black,
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
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'What would you like to change?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _buildNameTF(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildRollNoTF(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildClass10Marks(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildClass12Marks(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildCollegeMarks(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildCourseDropDown(),
                  SizedBox(
                    height: 30,
                  ),
                  _submitBtn(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String selectCity = "";
  final courseSelected = TextEditingController();
  List<String> courses = ["B.Tech: CSE", "B.Tech: CS-SD", "MCA", "BCA"];
}
