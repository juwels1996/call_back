import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardValue extends StatelessWidget {
  final String topic;
  final IconData icon;
  final Function callbackFunction;
  bool isvisible;

  CardValue({required this.topic,required this.icon, required this.callbackFunction,required this.isvisible});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          width: double.maxFinite,
          height: 70,
          margin: const EdgeInsets.only(top:20,left: 40,right: 40, bottom: 20),
          decoration: BoxDecoration(
              color:Colors.black,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    topic,
                    style: TextStyle(
                        fontSize: 20,
                        color:Colors.white
                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){
                  callbackFunction;
                  print("worked");
                },
                    icon: Icon(icon,color: Colors.white,),
                ),
              ],
            ),
          ),
        ),
      );
  }
}