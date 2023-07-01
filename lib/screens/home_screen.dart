import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:miniprojet_02/database/sqflite_helper.dart';
import 'package:miniprojet_02/screens/calcule.dart';
import 'package:miniprojet_02/screens/templates.dart';

class HomePage extends StatelessWidget {
  HomePage();
  final faker = Faker.instance;

  @override
  Widget build(BuildContext context) {
    String user_name = faker.name.fullName();
    return Column(
      children: [
        Row(
          children: [
            const Text("Hi ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
            Text(
              user_name,
              style: const TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                print("hello");
              },
              child: Icon(Icons.info),
            )
          ],
        ),
        const Spacer(),
        ElevatedButton(onPressed: () async{
          var data = await SqlHelper.db();
          print(data);
          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> template(CalculePage(), "Calculate")));
        }, child: const Text("Go"))
      ],
    );
  }
}
