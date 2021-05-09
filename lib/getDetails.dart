import 'package:flutter/material.dart';

class GetDetails extends StatefulWidget {
  @override
  _GetDetailsState createState() => _GetDetailsState();
}

class _GetDetailsState extends State<GetDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          "Company Details",
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
              vertical: 50,
            ),
            child: Column(children: <Widget>[
              DataTable(
                columnSpacing: 55,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Student Name',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Roll No',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Course',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Sarah')),
                      DataCell(Text('1656524')),
                      DataCell(Text('B.Tech CS-SD')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Janine')),
                      DataCell(Text('1566535')),
                      DataCell(Text('MCA')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('William')),
                      DataCell(Text('1598435')),
                      DataCell(Text('B.Tech CSE')),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
