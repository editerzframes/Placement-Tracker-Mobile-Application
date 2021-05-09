import 'package:Project/loginAsStudent.dart';
import 'package:Project/models/StudentModel.dart';
import 'package:Project/providers/DatabaseProvider.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String tfEntryName;
  int tfEntryRollNo;
  double tfEntryTenth;
  double tfEntryTwelfth;
  double tfEntryCgpa;
  String tfEntryCourse;
  String tfEntryEmail;
  String tfEntryPassword;
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
                onChanged: (value) => tfEntryName = value,
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
                onChanged: (value) => tfEntryRollNo = int.parse(value),
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
                tfEntryCourse = value;
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
                onChanged: (value) => tfEntryTenth = double.parse(value),
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

  Widget _buildemail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                onChanged: (value) => tfEntryEmail = value,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.description,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                onChanged: (value) => tfEntryPassword = value,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
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
                onChanged: (value) => tfEntryTwelfth = double.parse(value),
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
                onChanged: (value) => tfEntryCgpa = double.parse(value),
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
        onPressed: () {
          signupAction();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LogInScreen(),
              ));
        },
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
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome',
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
                    'We would really like to know you better. Fill in some details and we will handle the rest',
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
                  _buildemail(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildPassword(),
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

  final List<String> courses = ["B.Tech: CSE", "B.Tech: CS-SD", "MCA", "BCA"];
  void signupAction() async {
    var student = StudentModel(
        name: tfEntryName,
        cgpa: tfEntryCgpa,
        course: tfEntryCourse,
        email: tfEntryEmail,
        password: tfEntryPassword,
        rollNumber: tfEntryRollNo,
        tenth: tfEntryTenth,
        twelfth: tfEntryTwelfth);
    var dbProvider = DatabaseProvider();
    print("Saving Data");
    await dbProvider.addStudent(student);
  }
}
