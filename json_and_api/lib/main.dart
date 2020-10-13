import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Employee.dart';
import 'DetailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Show JSON Data'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Employee>> _getEmployees() async {
    var data = await http.get("http://www.json-generator.com/api/json/get/clJwJtWEOa?indent=2");
    var jsonData = json.decode(data.body);
    List <Employee> employees = [];

    for (var e in jsonData) {
      Employee employee = Employee(e["userId"], e["jobTitle"], e["firstName"], e["lastName"], e["image"]);
      employees.add(employee);
    }

    return employees;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getEmployees(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Loading...'),
                ),
              );
            } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data[index].image
                        ),
                      ),
                      title: Text('${snapshot.data[index].firstName} ${snapshot.data[index].lastName}'),
                      subtitle: Text(snapshot.data[index].jobTitle),
                      onTap: () {
                        Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                        );
                      },
                    );
                },
                );
            }
          },
        ),
      ),
    );
  }
}