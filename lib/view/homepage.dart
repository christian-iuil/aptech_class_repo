
import 'dart:math';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Color _backgroundColor = Colors.white;

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = _generateRandomColor();
    });
  }

  Color _generateRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }
  List getTextData=[

    'hello',
    'world',
    'Yes',
    'No',
    'Fine',
    'Am Good thanks',
    'Hmmmmm cant answer the question',
    'ask someone else',
    'Answer That Yourself',
    'Jamb Question',
    'Ode Ask Me One More Time',
    'Mumu Ask yourself na',
    'Yes',
    'Pass',
    'Ohhh Let not answer that',
    'Ask Google',
    'Maybe',
    'Hmmmmmm, I dont know',
    'okay',
    'Nothing',
    'Am fine',
  ];
  int index=0;
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(
          actions: [TextButton(onPressed: _changeBackgroundColor, child:
          const Icon(Icons.nightlight_outlined,color: Colors.white,),),],
          title: const Text('Flutter App Bar'),
          bottom: TabBar(tabs: [
            buildTab(Icons.home),
            buildTab(Icons.search),
            buildTab(Icons.person),
            buildTab(CupertinoIcons.gear),

          ],),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                      padding: const EdgeInsets.all(30),
                      itemCount:getTextData.length,
                      itemBuilder: (context,int index){
                        return Text(getTextData[index],style: const TextStyle(fontSize: 30),);
                      }),

                  Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Text(getTextData[index]),
                    InkWell(
                        onTap: (){
                          setState(() {
                            index = Random().nextInt(18);
                          });
                        },
                        child: const Text('Get Answer')),
                  ],),
                  buildText('home page',CupertinoIcons.person_2_alt,40),
                  buildText('home page',CupertinoIcons.gear_solid,100),
                ],),
            ),
          ],
        ),
      ),
    );
  }

  buildText(String text,IconData iconData,double height) => Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(iconData,size:height ,),
      Text(text),
    ],
  ));

  Tab buildTab(IconData iconData) => Tab(child: Icon(iconData,size: 35,),);
}