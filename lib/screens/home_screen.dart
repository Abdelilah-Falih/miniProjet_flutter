import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage();
  final faker = Faker.instance;

  @override
  Widget build(BuildContext context) {
    String user_name = faker.name.fullName();
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
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
              child: Column(
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
                  ElevatedButton(onPressed: () {}, child: const Text("Go"))
                ],
              ),
            ),
          ),
        ));
  }
}
