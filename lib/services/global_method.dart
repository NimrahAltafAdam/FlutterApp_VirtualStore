import 'package:flutter/material.dart';

class GlobalMethods{
  //**As this method is no longer private(_showBialog) therefore _ was removed and the name was changed to showDialogg
  Future<void> showDialogg(String title, String subtitle, Function fct, BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Image.network(
                      'https://image.flaticon.com/icons/png/128/564/564619.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title),
                  ),
                ],
              ),
              content: Text(subtitle),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel')), // TextButton),
                TextButton(
                    onPressed: () {
                      fct();
                      Navigator.pop(context);
                    },
                    child: Text('Ok'))
              ]);
        });
  }
}