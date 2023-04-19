//
//
// import 'package:flutter/material.dart';
//
// class CalculatorWithPlugin extends StatefulWidget {
//   const CalculatorWithPlugin({Key? key}) : super(key: key);
//
//   @override
//   State<CalculatorWithPlugin> createState() => _CalculatorWithPluginState();
// }
//
// class _CalculatorWithPluginState extends State<CalculatorWithPlugin> {
//   String result = "";
//   String expression = "";
//   bool hasError = false;
//   buttonPressed(String buttonText) {
//     setState(() {
//       if (buttonText == "CLEAR") {
//         result = "";
//         expression = "";
//         hasError = false;
//       } else if (buttonText == "=") {
//         try {
//           Parser p = Parser();
//           Expression exp = p.parse(expression);
//           ContextModel cm = ContextModel();
//           double eval = exp.evaluate(EvaluationType.REAL, cm);
//           result = eval.toString();
//           expression = "";
//           hasError = false;
//         } catch (e) {
//           result = "Error";
//           expression = "";
//           hasError = true;
//         }
//       } else {
//         if (hasError) {
//           result = "";
//           hasError = false;
//         }
//         expression += buttonText;
//       }
//     });
//   }
//
//   Widget buildButton(String buttonText, {Color color = Colors.blue}) {
//     return InkWell(
//       onTap: () => buttonPressed(buttonText),
//
//       child: Expanded(
//         child: Container(
//           color: color,
//           padding: EdgeInsets.all(24.0),
//           child: Text(
//             buttonText,
//             style: TextStyle(fontSize: 20.0, color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Calculator'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Container(
//             alignment: Alignment.centerRight,
//             padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
//             child: Text(
//               result,
//               style: TextStyle(fontSize: 48.0, color: hasError ? Colors.red : Colors.black),
//             ),
//           ),
//           Expanded(
//             child: Divider(),
//           ),
//           Row(
//             children: <Widget>[
//               buildButton("7"),
//               buildButton("8"),
//               buildButton("9"),
//               buildButton("/", color: Colors.orange),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               buildButton("4"),
//               buildButton("5"),
//               buildButton("6"),
//               buildButton("*", color: Colors.orange),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               buildButton("1"),
//               buildButton("2"),
//               buildButton("3"),
//               buildButton("-", color: Colors.orange),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               buildButton("."),
//               buildButton("0"),
//               buildButton("00"),
//               buildButton("+", color: Colors.orange),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               buildButton("CLEAR", color: Colors.grey),
//               buildButton("=", color: Colors.orange),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
