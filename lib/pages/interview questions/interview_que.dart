import 'dart:ffi';

import 'package:copy_of_margdrashak/gemini/gemini_services.dart';
import 'package:copy_of_margdrashak/pages/interview%20questions/questions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InterviewQue extends StatefulWidget {
  const InterviewQue({super.key});

  @override
  State<InterviewQue> createState() => _InterviewQueState();
}

class _InterviewQueState extends State<InterviewQue> {
  List courses = [];
  String ans = "";

  Future get_courses_data() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      courses = pref.getStringList('courses selected') ?? [];
    });
    print(courses);
  }

  @override
  void initState() {
    super.initState();
    get_courses_data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Text('get prepared for your intervierws'),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    print('listview builder started');
                    return GestureDetector(
                      child: Text(courses[index]),
                      onTap: () async {
                        String gemini_ans = await gemini_api.getgeminidata(
                            'can you give me the top 10 interview questions with answers of ${courses[index]}');
                        setState(() {
                          ans = gemini_ans;
                        });
                        // print('after setstate');

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Questions(
                                gemini_questions: ans,
                              ),
                            ));
                      },
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
