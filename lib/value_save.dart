import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  Function valuepass;
  List<String> entriess = [];
  bool isEnabled = false;
  CustomDialog(
      {required this.title,
      required this.valuepass,
      required this.entriess,
      required this.isEnabled});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  TextEditingController textController = TextEditingController();
  bool isvisible = true;

  @override
  void initState() {
    print('lenght=====>${widget.entriess.length}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 600,
      child: Column(
        children: [
          TextField(
            controller: textController,
          ),
          SizedBox(
            height: 35,
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.entriess.add(textController.text);
                textController.clear();
              });
            },
            child: Text(
              "Save",
              style: TextStyle(fontSize: 28, color: Colors.tealAccent),
            ),
          ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 15,
          ),
          ...widget.entriess.map(
            (e) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(e),
                TextButton(
                    onPressed: () {
                      setState(() {
                        widget.entriess.remove(e);
                      });
                    },
                    child: Icon(Icons.delete)),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        textController.text = widget.entriess[0];
                        widget.entriess.remove(e);
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
          Align(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  widget.valuepass();
                  Navigator.of(context).pop();
                });
              },
              child: Text("Ok"),
            ),
          ),
        ],
      ),
    );
  }
}
