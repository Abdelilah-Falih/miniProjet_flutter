import 'dart:io';

import 'package:flutter/material.dart';

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
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: RadioMenuButton(
              value: "plus",
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value!;
                });
              },
              child: Text("+")),
        ),
        RadioMenuButton(
            value: "minus",
            groupValue: _groupValue,
            onChanged: (value) {
              setState(() {
                _groupValue = value!;
              });
            },
            child: Text("-")),
        RadioMenuButton(
            value: "multi",
            groupValue: _groupValue,
            onChanged: (value) {
              setState(() {
                _groupValue = value!;
              });
            },
            child: Text("*")),
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
