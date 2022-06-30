import 'package:flutter/material.dart';

import 'card_value.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String topic="This is my card";
  bool invisible=true;

  callback(varTopic){
    setState(() {
      topic=varTopic;

      print("Worked");

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("callback call"),
        ),
        body: Column(
          children: [

            InkWell(
              onTap: (){
                setState(() {
                  invisible=!invisible;
                });
              },
              child: invisible?CardValue(topic: "This is my Card", callbackFunction:callback, isvisible: invisible,
                icon: Icons.cancel,):
              Container(),
            ),
          ],
        ),
      ),
    );
  }
}