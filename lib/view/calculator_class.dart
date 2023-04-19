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
        title: Text('Calculator'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  Text(
                    '0',
                    style: TextStyle(fontSize: 50),
                  ),
                  Text(
                    '0',
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Divider(
                thickness: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      button('7',kBgColor,kTextColor),
                      button('8',kBgColor,kTextColor),
                      button('9',kBgColor,kTextColor),
                      button('%',kBgColor,kTextColorII),
                    ],
                  ),
                  sizeHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      button('7',kBgColor,kTextColor),
                      button('8',kBgColor,kTextColor),
                      button('9',kBgColor,kTextColor),
                      button('%',kBgColor,kTextColorII),
                    ],
                  ),
                  sizeHeight(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      button('7',kBgColor,kTextColor),
                      button('8',kBgColor,kTextColor),
                      button('9',kBgColor,kTextColor),
                      button('%',kBgColor,kTextColorII),
                    ],
                  ),
                  sizeHeight(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      button('7',kBgColor,kTextColor),
                      button('8',kBgColor,kTextColor),
                      button('9',kBgColor,kTextColor),
                      button('%',kBgColor,kTextColorII),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox sizeHeight() => SizedBox(height: 20,);

  TextButton button( String buttonText,Color bgColor, Color textColor) {
    return TextButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(const Size(80, 80)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                        backgroundColor:
                            MaterialStateColor.resolveWith((states) => bgColor),
                      ),
                      onPressed: ()=>print(buttonText),
                      child: Text(
                       buttonText,
                        style:  TextStyle(fontSize: 30, fontWeight: FontWeight.w600,color: textColor),
                      ),
                    );
  }
}
