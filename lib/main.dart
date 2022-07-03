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
                  child: ValueSave(entry: newList,
                      isEnabled: invisible)
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


class ValueSave extends StatefulWidget {
  List<String> entry = [];
  bool isEnabled = false;
  ValueSave(
      {
        required this.entry,
        required this.isEnabled});

  @override
  State<ValueSave> createState() => _ValueSaveState();
}

class _ValueSaveState extends State<ValueSave> {
  bool isvisible = true;
  TextEditingController textController=TextEditingController();

  @override
  void initState() {
    print('lenght=====>${widget.entry.length}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 600,
      child: Column(
        children: [

          InkWell(
            onTap: () {
              setState(() {
                widget.entry.add(textController.text);
                textController.clear();
              });
            },
            child: Text(
              "",
              style: TextStyle(fontSize: 12, color: Colors.tealAccent),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ...widget.entry.map(
                (e) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(e),
                TextButton(
                    onPressed: () {
                      setState(() {
                        widget.entry.remove(e);
                      });
                    },
                    child: Icon(Icons.delete)),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        textController.text = widget.entry[0];
                        widget.entry.remove(e);
                      });
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.red,
                      size: 24,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

