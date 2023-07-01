import 'package:flutter/material.dart';

class ResultCalcul extends StatelessWidget {
  late int number01;
  late int number02;
  late String operation;
  late int result;
  late String message;

  ResultCalcul(int number01, int number02, String operation) {
    this.number01 = number01;
    this.number02 = number02;
    this.operation = operation;

    switch (operation) {
      case "plus":
        result = number01 + number02;
        operation = '+';
        break;
      case "minus":
        result = number01 - number02;
        operation = '-';
        break;
      case "mult":
        result = number01 * number02;
        operation = 'x';
        break;
      default:
        message = "Invalid Operation $operation";
        return;
    }
    message = "$number01 $operation $number02 = $result";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: [
          Image(
            image: AssetImage("assets/ic_calculatrice.png"),
          ),
          SizedBox(width: 30,),
          Text(message,
          textWidthBasis: TextWidthBasis.longestLine,
          style: TextStyle(fontSize: 35, 
          ),)
        ])
      ],
    );
  }
}
