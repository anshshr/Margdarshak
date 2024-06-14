// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors



import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget my_custom_container(
    String lottie_url, String title_text, String description, Color color) {
  return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
      decoration: BoxDecoration(
        color: color,
      ),
      child: Column(
        children: [
          //faeture name
          Text(
            title_text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 30,),

          //lottie animaton
          Lottie.network(lottie_url,height: 300,width: double.infinity),

          SizedBox(height: 40,),

          //short description
          Text(
            description,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ));
}

List<Widget> pages = [
  my_custom_container(
      "https://lottie.host/f522dbd8-8ade-402e-ab09-656f5cd37e69/gcGP8zlQcG.json",
      'LEARNING COURSES',
      'The app includes a courses section where users can access a variety of courses on different topics. These courses are designed to help users develop skills and knowledge relevant to their desired career paths.',
      Colors.indigo[100]!),
  my_custom_container(
      "https://lottie.host/e6c6b784-1588-4043-92c8-3851667a6c31/lCRmcDFHzK.json",
      'ATS SCORE CALCULATOR',
      'The app includes an Applicant Tracking System (ATS) core analysis tool. Users can upload their resumes, and the app will analyze them against common ATS criteria, providing a score that highlights areas for improvement.',
      Colors.lightBlue[100]!),
  my_custom_container(
      "https://lottie.host/1578e1aa-7fe5-44ea-805e-e033e7014068/Kcg9ynyq9z.json",
      'PACTICE  ARENA',
      'The app offers a comprehensive quiz section where users can take quizzes on various topics to prepare for interviews.',
      Colors.grey[300]!),
  my_custom_container(
      "https://lottie.host/007139ce-f974-4ee8-97ae-ab409906fe26/X1U5AlauZX.json",
      'RESUME  REVIEW',
      'This feature allows users to compare their resumes against specific job descriptions. The app provides detailed feedback on how well the resume matches the job requirements, suggesting areas for enhancement.',
      Colors.lightGreen[100]!),
  my_custom_container(
      "https://lottie.host/7d41c749-664b-4604-a4d7-d9659b528970/RIBqTGddBT.json",
      'A.I. ASSISTANT ARYA',
      "Embedded within the quiz section, Arya is an interactive assistant that guides users through quizzes. Arya can suggest topics, provide hints, and offer feedback based on the user's performance.",
      Colors.orange[100]!)
];
