import 'package:flutter/material.dart';

class Dialogs {

  static Future<AlertDialog> SuccessMessage(
      BuildContext context,
      String title,
      String body,
      ) async {
    final alertDialog = await MyAbortDialog(context, title, body, "success");
    return alertDialog;
  }

  static Future<AlertDialog> FailureMessage(
      BuildContext context,
      String title,
      String body,
      ) async {
    final alertDialog = await MyAbortDialog(context, title, body, "fail");
    return alertDialog;
  }

  static Future<AlertDialog> MyAbortDialog(
      BuildContext context,
      String title,
      String body,
      String type
      ) async {
    final alertDialog = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Column(
              children:[
                Icon(
                    (type == 'success' ? Icons.check_circle_rounded : Icons.warning),
                    color: (type == 'success' ? Colors.green : Colors.red),
                    size: 72
                ),
                Text(title),
              ]
          ),
          content: Text(body),
          actions: <Widget>[
            RaisedButton(
              color: (type == 'success' ? Colors.green : Colors.red),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
    return alertDialog;
  }
}