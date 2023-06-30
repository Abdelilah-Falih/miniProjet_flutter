import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            color: Color.fromARGB(255, 169, 217, 249),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Hi ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const Text(
                        " Mr.Falih",
                        style: TextStyle(
                          fontSize: 20,
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
