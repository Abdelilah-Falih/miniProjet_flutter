import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miniprojet_02/database/sqflite_helper.dart';
import 'package:miniprojet_02/screens/resultat.dart';
import 'package:miniprojet_02/screens/templates.dart';

// class CalculatePage extends StatefulWidget{
//   CalculatePage();

// @override

// }

class CalculePage extends StatefulWidget {
  CalculePage({super.key});

  @override
  State<CalculePage> createState() => _CalculePageState();
}

class _CalculePageState extends State<CalculePage> {
  TextEditingController f_number = TextEditingController();
  TextEditingController s_number = TextEditingController();
  String _groupValue = "plus";
  List<Widget> radioButtons = [];
  SqlDb sqlDb = SqlDb();

  @override
  void initState() async {
    super.initState();
    var data = await sqlDb.getAllOperations();
    
    for (var i = 0; i < data.length; i++) {
      var operation = data[i];
      radioButtons.add(
          RadioMenuButton(
            value: operation.value,
            groupValue: _groupValue,
            onChanged: (value) {
              setState(() {
                _groupValue = value!;
              });
            },
            child: Text(operation.symbol)),
      );
    }

    

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          controller: f_number,
          decoration: const InputDecoration(hintText: "First number"),
        ),
        Column(children: radioButtons),
        TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          controller: s_number,
          decoration: const InputDecoration(hintText: "Second number"),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: ElevatedButton(
              onPressed: () {
                try {
                  int number01 = int.parse(f_number.text);
                  int number02 = int.parse(s_number.text);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> template(ResultCalcul(number01, number02, _groupValue), "Result")));

                } on Exception {
                  var dialog = AlertDialog(
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("understand"))
                    ],
                    title: Text("Caution"),
                    content: Row(
                      children: [
                        Icon(Icons.info),
                        SizedBox(
                          width: 10,
                        ),
                        Text("You should enter an Integer"),
                      ],
                    ),
                  );
                  showDialog(
                    context: context,
                    builder: (context) => dialog,
                    barrierDismissible: false,
                    barrierLabel: "cancle",
                  );
                }
              },
              child: const Text("Calculate")),
        )
      ],
    );
  }
  
  
}
