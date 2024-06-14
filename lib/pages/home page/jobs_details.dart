// ignore_for_file: prefer_const_constructors


// to show the complete job details of any job at the start page and also have acces to apply at the job as well

import 'package:flutter/material.dart';

class JobsDetails extends StatefulWidget {
  const JobsDetails({super.key});

  @override
  State<JobsDetails> createState() => _JobsDetailsState();
}

class _JobsDetailsState extends State<JobsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 50),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.indigo[100]!,
                Colors.indigo[200]!,
                Colors.indigo[300]!,
                Colors.indigo[300]!,
                Colors.indigo[200]!,
              ])),
              
      ),
    );
  }
}