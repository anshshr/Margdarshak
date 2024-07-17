// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  String gemini_questions;
  Questions({
    super.key,
    required this.gemini_questions,
  });

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.gemini_questions == "" ? CircularProgressIndicator():
      Text(widget.gemini_questions),
    );
  }
}
