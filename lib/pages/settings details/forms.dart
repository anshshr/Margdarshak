import 'package:flutter/material.dart';

import '../../my widgets/my_button.dart';
import '../../my widgets/my_dialog.dart';

Future problem_dialog(BuildContext context) {
  TextEditingController name = TextEditingController();
  TextEditingController problem = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          title: Text(
            'REPORT YOUR PROBLEM',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          backgroundColor: Colors.grey[100],
          actions: [
            //name
            TextField(
              controller: name,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter your name',
                  label: Text('Enter your name'),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.5),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        color: Colors.purple[200]!,
                        width: 30,
                        style: BorderStyle.solid),
                  )),
            ),
            SizedBox(
              height: 20,
            ),

            //problem
            TextField(
              controller: problem,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black87, width: 3.5, strokeAlign: 2),
                    borderRadius: BorderRadius.circular(20)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintText: 'Enter your Problem',
              ),
            ),
            SizedBox(
              height: 20,
            ),

            my_button(
                text: 'S U B M I T',
                ontap: () {
                  if (name.text != "" && problem.text != "") {
                    Navigator.pop(context);
                  } else {
                    dialog(context, 'Please Enter the Details');
                  }
                })
          ],
        ),
      );
    },
  );
}
Future feedback_dialog(BuildContext context) {
  TextEditingController name = TextEditingController();
  TextEditingController problem = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          title: Text(
            'ENTER YOUR FEEDBACK',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          backgroundColor: Colors.grey[100],
          actions: [
            //name
            TextField(
              controller: name,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter your name',
                  label: Text('Enter your name'),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.5),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        color: Colors.purple[200]!,
                        width: 30,
                        style: BorderStyle.solid),
                  )),
            ),
            SizedBox(
              height: 20,
            ),

            //problem
            TextField(
              controller: problem,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black87, width: 3.5, strokeAlign: 2),
                    borderRadius: BorderRadius.circular(20)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintText: 'Enter your Feedgack',
              ),
            ),
            SizedBox(
              height: 20,
            ),

            my_button(
                text: 'S U B M I T',
                ontap: () {
                  if (name.text != "" && problem.text != "") {
                    Navigator.pop(context);
                  } else {
                    dialog(context, 'Please Enter the Details');
                  }
                })
          ],
        ),
      );
    },
  );
}



