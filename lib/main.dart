import 'dart:html';
import 'dart:ui';
import 'package:callback_functionss/card_value.dart';
import 'package:callback_functionss/value_save.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textsController=TextEditingController();
  bool invisible=true;
  List<String>newList=[];


  // valuespasses(){
  //   setState(() {
  //     invisible=!invisible;
  //     print("ok work");
  //
  //   });
  // }

  cardpasses(){
    setState(() {
      invisible=!invisible;
      print("value work!");
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [


          Text("This is main Page"),
          Center(
            child: invisible?TextButton(
              onPressed: () {
                print('l1======>${newList.length}');
                showDialog(
                    context: context,
                    builder: (context) =>  Dialog(
                      elevation: 7,
                      backgroundColor: Colors.grey,
                      child: CustomDialog(
                          title: "get value ",
                          valuepass: cardpasses,

                          entriess: newList,
                          isEnabled: invisible

                      ),
                    )
                );
              },
              child: Text("Click here"),
            ):
                Container(
                  color: Colors.white70,
                  child: CustomDialog(
                      title: "back value",
                      valuepass: (){},
                      entriess: newList,
                      isEnabled: false),
                )
          ),







          // invisible? CardValue(
          //     topic: 'value back',
          //     icon: Icons.cancel,
          //     callbackFunction: cardpasses,
          //     isvisible: invisible):Container(),


          // CustomDialog(
          //     title: "get value ",
          //     valuepass: (){},
          //     entriess: newList,
          //     isEnabled: invisible
          //
          // )





          // CustomDialog(title:"Some Value",
          //     valuepass: valuespasses,
          //     textController: textsController,
          //     entries:newList ,
          //     isEnabled: invisible)
        ],
      ),
    );
  }
}