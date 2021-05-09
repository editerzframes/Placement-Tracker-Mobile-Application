import 'package:Project/models/CompanyModel.dart';
import 'package:Project/providers/DatabaseProvider.dart';
import 'package:flutter/material.dart';

class AdminCreateCompany extends StatefulWidget {
  @override
  _AdminCreateCompanyState createState() => _AdminCreateCompanyState();
}

class _AdminCreateCompanyState extends State<AdminCreateCompany> {
  dynamic tfEntryName,
      tfEntryTenth,
      tfEntryTwelfth,
      tfEntryGraduation,
      tfEntryBacklogs,
      tfEntryCtc,
      tfEntryArrival,
      tfEntryLink,
      tfEntryDetails;
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
                onChanged: (value) => tfEntryTenth = value,
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
                onChanged: (value) => tfEntryDetails = value,
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
                onChanged: (value) => tfEntryTwelfth,
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
                onChanged: (value) => tfEntryGraduation = value,
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
                onChanged: (value) => tfEntryBacklogs = value,
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

  Widget _buildLink() {
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
                onChanged: (value) => tfEntryLink = value,
                keyboardType: TextInputType.url,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Google Form Link',
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.description,
                    )),
              ),
            ))
      ],
    );
  }

  Widget _buildCompanyDate() {
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
                onChanged: (value) => tfEntryArrival = value,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Company Arrival Date',
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
                onChanged: (value) => tfEntryCtc = value,
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

  Widget _submitBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          createCompanyAction();
        },
        elevation: 10,
        padding: EdgeInsets.all(15),
        color: Colors.green,
        child: Text(
          "Create Company",
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
                    'Create Company',
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
                  _buildCompanyDate(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildLink(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildCompanyDetail(),
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

  void createCompanyAction() {
    var companyObject = CompanyModel(
        name: tfEntryName,
        arrival: tfEntryArrival,
        backlogs: tfEntryBacklogs,
        ctc: tfEntryCtc,
        details: tfEntryDetails,
        graduation: tfEntryGraduation,
        link: tfEntryLink,
        tenth: tfEntryTenth,
        twelfth: tfEntryTwelfth);
    var dbProvider = DatabaseProvider();
    dbProvider.addCompany(companyObject);
    debugPrint("Company Added");
  }
}
