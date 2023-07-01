import 'package:flutter/material.dart';

Widget template(Widget page, String title){
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), 
            color: Color.fromARGB(255, 169, 217, 249),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: page)
          )
        )
    );
  }