import 'package:Project/loginAsAdmin.dart';

import 'package:Project/providers/DatabaseProvider.dart';
import 'package:flutter/material.dart';
import 'package:Project/loginAsStudent.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mPlacementTracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
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
                  Image.asset(
                    'assets/images/youare.png',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'mPlacementTracker',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 40.0,
                      fontFamily: 'Schyler',
                    ),
                  ),
                  SizedBox(height: 60),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInScreen()),
                        );
                      },
                      elevation: 10,
                      padding: EdgeInsets.all(15),
                      color: Colors.green,
                      child: Text(
                        "I'm a  Student",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Schyler',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInAdminScreen()),
                        );
                      },
                      elevation: 10,
                      padding: EdgeInsets.all(15),
                      color: Colors.green,
                      child: Text(
                        "I'm an  Administrator",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Schyler',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
