import 'package:flutter/material.dart';
class CrossButton extends StatefulWidget {
  const CrossButton({Key? key}) : super(key: key);

  @override
  State<CrossButton> createState() => _CrossButtonState();
}

class _CrossButtonState extends State<CrossButton> {
  bool isvisible=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.blue,
            decoration: BoxDecoration(

            ),
            child: Visibility(
              visible: isvisible,
              child: ElevatedButton(onPressed: (){},
                  child: Text("String")),
            ),
          ),
          InkWell(
            onTap: ()=>
            setState(() {
              isvisible=!isvisible;
            }),

            child: Icon(Icons.cancel),
          )

        ],
      )
    );
  }
}


