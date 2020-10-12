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
  List <User> selectedUsers;
  bool isSort;

  @override
  void initState() {
    isSort = false;
    users = User.getUsers();
    selectedUsers = [];
    super.initState();
  }

  void onSortColumn(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.firstName.compareTo(b.firstName));
      }
      else {
        users.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
  }

  void onSelectedRow(bool selected, User user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(user);
      }
      else {
        selectedUsers.remove(user);
      }
    });
  }

  SingleChildScrollView dataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: isSort,
        sortColumnIndex: 0,
        columns: [
        DataColumn(
          label: Text("FIRST NAME"),
          numeric: false,
          tooltip: 'This is First Name',
          onSort: (columnIndex, ascending) {
            setState(() {
              isSort = !isSort;
            });
            onSortColumn(columnIndex, ascending);
          }
        ),
        DataColumn(
          label: Text("LAST NAME"),
          numeric: false,
          tooltip: 'This is Last Name',
        ),
      ],
        rows: users.map(
              (user) => DataRow(
                selected: selectedUsers.contains(user),
                onSelectChanged: (b) {
                  onSelectedRow(b, user);
                },
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
      ),
    );
  }

  void deleteSelected() async {
    setState(() {
      if (selectedUsers.isNotEmpty) {
        List <User> tmp = [];
        tmp.addAll(selectedUsers);
        for (User user in tmp) {
          users.remove(user);
          selectedUsers.remove(user);
        }
      }
    });
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
          Expanded(
              // child: Center(
                child: dataTable(),
              // ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('SELECTED ${selectedUsers.length}'),
                  onPressed: () {

                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('DELETE SELECTED'),
                  onPressed:selectedUsers.isEmpty
                      ? null : () {
                    deleteSelected();
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
