import 'package:Project/AdminCreateCompany.dart';
import 'package:Project/AdminOpenCompany.dart';
import 'package:Project/StudentProfile.dart';
import 'package:Project/models/CompanyModel.dart';
import 'package:Project/providers/DatabaseProvider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
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
            child: getAllButtons(),
          ),
        ),
      ),
    );

    // final titles = ['A', 'B', 'C', 'D'];

    // return ListView.builder(
    //   itemCount: titles.length,
    //   itemBuilder: (context, index) {
    //     return Card(
    //       //                           <-- Card widget
    //       child: ListTile(
    //         trailing: Icon(Icons.keyboard_arrow_right),
    //         title: Text(titles[index]),
    //         onTap: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => AdminOpenCompany()),
    //           );
    //         },
    //       ),
    //     );
    //   },
    // );
  }

  Future<List<CompanyModel>> getAllCompanies() async =>
      await DatabaseProvider().fetchCompanies();

  dynamic getAllButtons() {
    return FutureBuilder<List<CompanyModel>>(
      future: getAllCompanies(),
      builder: (context, AsyncSnapshot<List<CompanyModel>> snapshot) {
        if (snapshot.hasData) {
          var theListOfCompanies = snapshot.data;
          List<Widget> listOfWidgets = <Widget>[];
          theListOfCompanies?.forEach((element) {
            var theCupertinoButton = CupertinoButton(
              child: getRowWidget(element),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminOpenCompany(
                        selectedCompany: element,
                      ),
                    ));
              },
            );
            listOfWidgets.add(theCupertinoButton);
          });
          return Column(
            children: listOfWidgets,
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget getRowWidget(CompanyModel company) {
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
              company.name,
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
              company.arrival,
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
              company.ctc.toString(),
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
}
