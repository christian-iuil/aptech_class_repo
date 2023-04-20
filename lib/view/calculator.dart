import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "";
  var num1;
  var num2;
  String operand = "";

  buttonPressed(String buttonText) {
    try {
      if (buttonText == "CLEAR") {
        result = "";
        num1 = '';
        num2 = '';
        operand = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "*" ||
          buttonText == "/") {
        num1 = int.parse(result);
        operand = buttonText;
        result = "";
      }
      else if (buttonText == "=") {
        num2 = int.parse(result);
        if (operand == "+") {
          result = (num1 + num2).toString();
        }
        if (operand == "-") {
          result = (num1 - num2).toString();
        }
        if (operand == "*") {
          result = (num1 * num2).toString();
        }
        if (operand == "/") {
          result = (num1 / num2).toString();
        }
        num1 = '';
        num2 = '';
        operand = "";
      } else if (buttonText == ".") {
        if (result.contains(".")) {
          return;
        } else {
          result += buttonText;
        }
      } else {
        result += buttonText;
      }
      setState(() {});
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Warning'),
          content: Text('Invalid Number'),
        ),
      );
    }
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: InkWell(
        onTap: () => buttonPressed(buttonText),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.brown)),
          width: 100,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 27.0),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            'Calculator',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Column(
              children: [
                Text(
                  num1 == null ? '' : num1.toString(),
                  style: const TextStyle(fontSize: 48.0),
                ),
                Text(
                  num2 == null ? '' : num2.toString(),
                  style: const TextStyle(fontSize: 48.0),
                ),
                Text(
                  result,
                  style: const TextStyle(fontSize: 48.0),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Row(
            children: <Widget>[
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("/"),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("*"),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("."),
              buildButton("0"),
              buildButton("00"),
              buildButton("+"),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("CLEAR"),
              buildButton("="),
            ],
          )
        ]));
  }
}
