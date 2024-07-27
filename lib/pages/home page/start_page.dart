// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'dart:io';

import 'package:copy_of_margdrashak/my%20widgets/my_container.dart';
import 'package:copy_of_margdrashak/pages/ATS%20score%20calculator/ats.dart';
import 'package:copy_of_margdrashak/pages/courses%20pages/courses.dart';
import 'package:copy_of_margdrashak/pages/home%20page/jobs_list.dart';
import 'package:copy_of_margdrashak/pages/interview%20questions/interview_que.dart';
import 'package:copy_of_margdrashak/pages/payments/offers_page.dart';
import 'package:copy_of_margdrashak/pages/quiz%20app/quiz_generator.dart';
import 'package:copy_of_margdrashak/pages/resume%20review/resume_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String? name;
  File? file;
  List courses = [];

  @override
  void initState() {
    super.initState();
    show_snackbar();
    get_total_details();
  }

  void show_snackbar() {
    Future.delayed(Duration(seconds: 5), () {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        '👉🏾👉🏾👉🏾👉🏾   Swipe right on screen to get more features',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,color: Colors.black87),
      ),backgroundColor: Colors.blueGrey[100],),
      snackBarAnimationStyle: AnimationStyle(
        curve: Curves.bounceIn,
        duration: Duration(seconds: 1),
        reverseCurve: Curves.bounceInOut,
        reverseDuration: Duration(seconds: 1),
      ),
      );
    });
  }

  Future get_total_details() async {
    await get_details();
  }

  Future get_details() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('name') == null ? 'user' : pref.getString('name');
      String? filePath = pref.getString('profile_picture');
      if (filePath != null && filePath.isNotEmpty) {
        file = File(filePath);
      }
    });
    setState(() {});
    courses = pref.getStringList('courses selected') ?? [];
    print(courses);
  }

  List<Widget> images = [
    //ats calculator
    my_container(
      url:
          'https://i.pinimg.com/236x/55/dd/eb/55ddebad50b46227096f859ac67d4abe.jpg',
      title_text: 'ATS CALCULATOR',
      desc_text:
          'Our app includes an Applicant Tracking System (ATS) core analysis tool.',
      base_icon: Icon(
        Icons.calculate_outlined,
        size: 80,
        color: Colors.black87,
      ),
    ),

    //resume review
    my_container(
      url:
          'https://i.pinimg.com/236x/9a/3a/4d/9a3a4dba26def32fdadc2479ec9e3379.jpg',
      title_text: 'EXPERT RESUME REVIEW',
      desc_text:
          'This feature allows users to compare their resumes against specific job descriptions.',
      base_icon: Icon(
        Icons.document_scanner_outlined,
        size: 70,
        color: Colors.black87,
      ),
    ),

    //ai assistant arya
    my_container(
      url:
          'https://i.pinimg.com/236x/27/46/cd/2746cda302b837f8089ed1285970893d.jpg',
      title_text: 'ARYA (A.I. ASSISTANT)',
      desc_text:
          " Arya can suggest topics, provide hints, and offer feedback based on the user's performance.",
      base_icon: Icon(
        Icons.person_3,
        size: 80,
        color: Colors.black87,
      ),
    ),

    //courses
    my_container(
      url:
          'https://i.pinimg.com/236x/98/d5/17/98d5177ca7b53c4e3db1205615d9c33c.jpg',
      title_text: 'COURSES',
      desc_text:
          'Our app includes a courses section where users can access a variety of courses on different topics.',
      base_icon: Icon(
        Icons.description,
        size: 80,
        color: Colors.black87,
      ),
    ),
    //quizzes
    my_container(
      url:
          'https://i.pinimg.com/236x/5d/28/0d/5d280d69167bafda2da00c54e1a4473e.jpg',
      title_text: 'TECH QUIZZES',
      desc_text:
          'Our app offers a comprehensive quiz section where users can take quizzes on various topics to prepare for interviews.',
      base_icon: Icon(
        Icons.quiz_rounded,
        size: 80,
        color: Colors.black87,
      ),
    ),
    //interview preparation
    my_container(
      url:
          'https://zeevector.com/wp-content/uploads/2021/03/Light-color-brochure-background-free-download-scaled.jpg',
      title_text: 'INTERVIEW PREPARATION',
      desc_text:
          'Our app offers a comprehensive where users can get latest interview questions and answers.',
      base_icon: Icon(
        Icons.question_answer,
        size: 80,
        color: Colors.black87,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.blue[100]!,
                Colors.blue[200]!,
                Colors.blue[300]!,
                Colors.blue[400]!,
                Colors.blue
              ])),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 60)
                .copyWith(bottom: 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      //circle avatar for displaying image uploaded by user

                      CircleAvatar(
                        radius: 30,
                        child: Center(
                            child: file == null
                                ? Icon(
                                    Icons.person,
                                    color: Colors.black87,
                                    size: 40,
                                  )
                                : ClipOval(
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Image.file(
                                          file!,
                                          fit: BoxFit.cover,
                                          height: 200,
                                          width: 200,
                                        )),
                                  )),
                      ),
                      SizedBox(
                        width: 15,
                      ),

                      //welcome text
                      Text(
                        'Welcome  $name ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    'We have got the best things covered for you',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //name of features  in caraousel slider

                  CarouselSlider(
                      items: images,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          autoPlayAnimationDuration: Duration(seconds: 3),
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          height: 200,
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          enlargeFactor: 1,
                          viewportFraction: 0.95,
                          animateToClosest: true,
                          disableCenter: true,
                          pauseAutoPlayOnTouch: true)),
                  SizedBox(
                    height: 20,
                  ),

                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Top Picks for only you , ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),

                  SizedBox(
                    height: 20,
                  ),
                  //jobs section
                  InkWell(
                    child: Card(
                      shadowColor: Colors.grey,
                      borderOnForeground: true,
                      color: Colors.white,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          '👨🏾‍💻👨🏾‍💻  SEE THE LATEST JOBS OF YOUR PREFERENCE',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobDisplayPage(),
                          ));
                    },
                  ),
                  //quiz section
                  InkWell(
                    child: Card(
                      shadowColor: Colors.grey,
                      borderOnForeground: true,
                      color: Colors.white,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          '😊😊 START YOUR DAY WITH THE PRACTICE SESSIONS',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizGenerator(),
                          ));
                    },
                  ),
                  //courses section
                  InkWell(
                    child: Card(
                      shadowColor: Colors.grey,
                      borderOnForeground: true,
                      color: Colors.white,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          "📖📖  LET'S LEARN SOMETHING NEW TODAY",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Courses(),
                          ));
                    },
                  ),
                  //interview preparation section
                  InkWell(
                    child: Card(
                      shadowColor: Colors.grey,
                      borderOnForeground: true,
                      color: Colors.white,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          '🙋🏾‍♂️🙋🏾‍♂️  READ THE LAST MINUTE INTERVIEW QUESTION ',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InterviewQue(),
                          ));
                    },
                  ),
                  //ats score section
                  InkWell(
                    child: Card(
                      shadowColor: Colors.grey,
                      borderOnForeground: true,
                      color: Colors.white,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          '🧑🏾‍🏫🧑🏾‍🏫  CHECKOUT THE ATS SCORE OF YOUR RESUME',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Ats(),
                          ));
                    },
                  ),
                  //resume review section
                  InkWell(
                    child: Card(
                      shadowColor: Colors.grey,
                      borderOnForeground: true,
                      color: Colors.white,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          '📄📄  COMPARE YOUR JOB DESCRIPTION WITH YOUR RESUME',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResumeReview(),
                          ));
                    },
                  ),
                  //PAYMENT SECTION
                  InkWell(
                    child: Card(
                      shadowColor: Colors.grey,
                      borderOnForeground: true,
                      color: Colors.white,
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          ' 💵💵 CHECK OUT THE PAYMENT SECTION ',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OffersPage(),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
