import 'package:flutter/material.dart';
import 'Employee.dart';

class DetailPage extends StatelessWidget {
  final Employee employee;

  DetailPage(this.employee);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${employee.firstName} ${employee.lastName}'),
      ),
    );
  }
}