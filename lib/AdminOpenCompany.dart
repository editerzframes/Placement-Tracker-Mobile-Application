import 'package:Project/models/CompanyModel.dart';
import 'package:Project/providers/DatabaseProvider.dart';
import 'package:flutter/material.dart';

class AdminOpenCompany extends StatefulWidget {
  final CompanyModel selectedCompany;
  AdminOpenCompany({Key key, @required this.selectedCompany}) : super(key: key);
  @override
  _AdminOpenCompanyState createState() =>
      _AdminOpenCompanyState(selectedCompany);
}

class _AdminOpenCompanyState extends State<AdminOpenCompany> {
  CompanyModel selectedCompany;
  _AdminOpenCompanyState(this.selectedCompany);
  String tName, tTenth, tTwelfth, tGrad, tBack, tCtc, tDet;
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
                onChanged: (value) => tName = value,
                controller:
                    TextEditingController(text: this.selectedCompany.name),
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Company Name',
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
                onChanged: (value) => tTenth = value,
                controller: TextEditingController(
                    text: this.selectedCompany.tenth.toString()),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Minimum Xth Marks',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.note,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _buildCompanyDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.grey,
              child: TextField(
                onChanged: (value) => tDet = value,
                controller:
                    TextEditingController(text: this.selectedCompany.details),
                maxLines: 8,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Company Details',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.description,
                    )),
              ),
            ))
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
                onChanged: (value) => tTwelfth = value,
                controller: TextEditingController(
                    text: this.selectedCompany.twelfth.toString()),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Minimum XIIth Marks',
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
                onChanged: (value) => tGrad = value,
                controller: TextEditingController(
                    text: this.selectedCompany.graduation.toString()),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Minimum Graduation Marks',
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
                onChanged: (value) => tBack = value,
                controller: TextEditingController(
                    text: this.selectedCompany.backlogs.toString()),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Maximum Backlog Allowed',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.description,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _buildCtc() {
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
                onChanged: (value) => tCtc = value,
                controller: TextEditingController(
                    text: this.selectedCompany.ctc.toString()),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'CTC',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.description,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _saveChangesBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () async {
          await DatabaseProvider().updateCompany(CompanyModel(
              name: tName,
              arrival: this.selectedCompany.arrival,
              backlogs: tBack,
              ctc: tCtc,
              details: tDet,
              graduation: tGrad,
              link: this.selectedCompany.link,
              tenth: tTenth,
              twelfth: tTwelfth));
          //Update Done Here
        },
        elevation: 10,
        padding: EdgeInsets.all(15),
        color: Colors.green,
        child: Text(
          "Save Changes",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Schyler',
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _deleteBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () => showAlertDialog(context),
        elevation: 10,
        padding: EdgeInsets.all(15),
        color: Colors.black,
        child: Text(
          "Delete Company",
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
                    'Company',
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
                  _buildCtc(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildCompanyDetail(),
                  SizedBox(
                    height: 30,
                  ),
                  _saveChangesBtn(),
                  SizedBox(
                    height: 10,
                  ),
                  _deleteBtn(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("Yes"),
      onPressed: () async {
        await DatabaseProvider().deleteCompany(this.selectedCompany.name);
      },
    );

    Widget noButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation"),
      content: Text("Are you sure to delete this company"),
      actions: [
        okButton,
        noButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
