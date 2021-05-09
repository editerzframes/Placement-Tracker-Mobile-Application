import 'package:Project/navigation.dart';
import 'package:Project/providers/DatabaseProvider.dart';
import 'package:Project/signup.dart';
import 'package:Project/studentDashboard.dart';
import 'package:flutter/material.dart';

import 'forgotPassword.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String tfEntryEmail;
  String tfEntryPassword;
  bool _rememberMe = false;
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                onChanged: (value) {
                  tfEntryEmail = value;
                },
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Schyler',
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: Material(
            elevation: 10.0,
            shadowColor: Colors.grey,
            child: TextField(
              onChanged: (value) {
                tfEntryPassword = value;
              },
              obscureText: true,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _forgot() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotPassword()),
          );
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            color: Colors.grey,
            fontFamily: 'Schyler',
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _remember() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black),
            child: Checkbox(
                value: _rememberMe,
                checkColor: Colors.white,
                activeColor: Colors.grey,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value;
                  });
                }),
          ),
          Text(
            "Remember Me",
            style: TextStyle(
                fontFamily: 'Schyler', color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _loginStudentBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () async {
          var userCanLogin = await canLogin(tfEntryEmail, tfEntryPassword);
          if (userCanLogin)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Navigation()),
            );
          else {
            print("Not recognized");
          }
        },
        elevation: 10,
        padding: EdgeInsets.all(15),
        color: Colors.green,
        child: Text(
          "Log In",
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
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/student.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Text(
                    'Sign In as Student',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontFamily: 'Schyler',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  _buildEmailTF(),
                  SizedBox(
                    height: 30.0,
                  ),
                  _buildPasswordTF(),
                  _forgot(),
                  _remember(),
                  SizedBox(
                    height: 20,
                  ),
                  _loginStudentBtn(),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      padding: EdgeInsets.only(right: 0.0),
                      child: Text(
                        "New User? Sign Up Here",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontFamily: 'Schyler',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /**
   * if (canLogin(email,password)) {
   * // Navigate to next screen upon successful login
   * }
   * else {
   * // Do what you have to do when the login is failed. User Not exists. 
   * }
   * 
   * 
   */

  Future<bool> canLogin(String email, String password) async {
    var dbProvider = DatabaseProvider();
    var listOfStudents = await dbProvider.fetchStudents();
    return listOfStudents.any(
        (student) => student.email == email && student.password == password);
  }
}
