import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget{
  AboutApp();
  List<String> info = ["About : Perform some basic arithmetic operations", "Year : 2023", "Developer: Abdelilah Falih", "Email : email@example.com", "Phone: (+212)6 12 34 56 78"];
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      padding: EdgeInsets.all(10),
      itemCount: info.length,
      itemBuilder: (BuildContext context, int index){
        return Container(
          alignment: Alignment.centerLeft,
          height: 70,
          color: Colors.amber[100],
          child: Row(
            children: [
              SizedBox(width:10, child: Container(width: 10,color:Colors.red),),
              const SizedBox(width: 10,),
              Flexible(child: Text(info[index], style: const TextStyle(fontSize: 20),)),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>const Divider(),
    );
  }

}