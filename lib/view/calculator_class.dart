import 'package:flutter/material.dart';

import '../style/styles.dart';

class Cal extends StatefulWidget {
  const Cal({Key? key}) : super(key: key);

  @override
  State<Cal> createState() => _CalState();
}

class _CalState extends State<Cal> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
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
                children: const [
                  Text(
                    '0',
                    style: TextStyle(fontSize: 80, color: Colors.white),
                  ),
                  Text(
                    '0',
                    style: TextStyle(fontSize: 80, color: Colors.white),
                  ),
                ],
              ),
            ),
            Spacer(),
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
                      button('%', kBgColor, kTextColor),
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

  SizedBox sizeHeight() => const SizedBox(
        height: 20,
      );

  TextButton button(String buttonText, Color bgColor, Color textColor) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(90, 90)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
        backgroundColor: MaterialStateColor.resolveWith((states) => bgColor),
      ),
      onPressed: () => print(buttonText),
      child: Text(
        buttonText,
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.w600, color: textColor),
      ),
    );
  }
}
