import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserDataTable(title: 'User Data'),
    );
  }
}

class UserDataTable extends StatefulWidget {
  UserDataTable({Key key, this.title}) : super(key: key);

  final String title;

  @override
  DataTableState createState() => DataTableState();
}

class DataTableState extends State<UserDataTable> {

  List <User> users;

  @override
  void initState() {
    users = User.getUsers();
    super.initState();
  }

  DataTable dataTable() {
    return DataTable(columns: [
      DataColumn(
        label: Text("First Name"),
        numeric: false,
        tooltip: 'This is First Name',
      ),
      DataColumn(
        label: Text("Last Name"),
        numeric: false,
        tooltip: 'This is Last Name',
      ),
    ], rows: users.map(
        (user) => DataRow(
          cells: [
            DataCell(
              Text(user.firstName),
              onTap: () {
                print('${user.firstName} selected');
              }
            ),
            DataCell(
              Text(user.lastName),
            ),
          ]
        )
    ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Center(
            child: dataTable(),
          )
        ],
      ),
    );
  }
}
