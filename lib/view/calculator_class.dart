import 'package:aptech_class_repo/style/styles.dart';
import 'package:flutter/material.dart';

class Cal extends StatefulWidget {
  const Cal({Key? key}) : super(key: key);

  @override
  State<Cal> createState() => _CalState();
}

class _CalState extends State<Cal> {
  String result = "";
  var num1;
  var num2;
  String operand = "";

  buttonResult(String buttonTextCal) {
    setState(() {
      if (buttonTextCal == 'c') {
        num1 = '';
        num2 = '';
        operand = '';
        result = '';
      } else if (buttonTextCal == "+" ||
          buttonTextCal == "-" ||
          buttonTextCal == "*" ||
          buttonTextCal == "/") {
        num1 = int.parse(result);
        operand = buttonTextCal;
        result = "";
      }
      else if (buttonTextCal == "=") {
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
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  Text(
                    num1 ?? '',
                    style: TextStyle(fontSize: 80, color: Colors.white),
                  ),
                  Text(
                    num2 ?? '',
                    style: TextStyle(fontSize: 80, color: Colors.white),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      button('c', kBgColor, kTextColorII),
                      button('.', kBgColor, kTextColor),
                      button('00', kBgColor, kTextColor),
                      button('+', kBgColor, kTextColor),
                    ],
                  ),
                  sizeHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      button('7', kBgColor, kTextWhiteColor),
                      button('8', kBgColor, kTextWhiteColor),
                      button('9', kBgColor, kTextWhiteColor),
                      button('/', kBgColor, kTextColor),
                    ],
                  ),
                  sizeHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      button('4', kBgColor, kTextWhiteColor),
                      button('5', kBgColor, kTextWhiteColor),
                      button('6', kBgColor, kTextWhiteColor),
                      button('-', kBgColor, kTextColor),
                    ],
                  ),
                  sizeHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      button('1', kBgColor, kTextWhiteColor),
                      button('2', kBgColor, kTextWhiteColor),
                      button('3', kBgColor, kTextWhiteColor),
                      button('=', kTextColor, kTextWhiteColor),
                    ],
                  ),
                  sizeHeight(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sizeHeight() => const SizedBox(
        height: 20,
      );

  button(String buttonText, Color bgColor, Color textColor) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(90, 90)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
        backgroundColor: MaterialStateColor.resolveWith((states) => bgColor),
      ),
      onPressed: () => buttonResult(buttonText),
      child: Text(
        buttonText,
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.w600, color: textColor),
      ),
    );
  }
}
