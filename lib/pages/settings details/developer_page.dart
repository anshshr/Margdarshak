import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class DeveloperPage extends StatelessWidget {
  const DeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 30),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.yellow[100]!,
              Colors.yellow[200]!,
              Colors.yellow[300]!,
              Colors.yellow[300]!,
              Colors.yellow[200]!,
            ])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                'Ansh Shrivastav R.',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Vastral, Ahmedabad, Gujarat'),
              Text('Phone: 8735838199'),
              Text('Email: anshshriofficial@gmail.com'),
              Divider(),
              Text(
                'Education',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text('Lalbhai Dalpatbhai College of Engineering'),
              Text('B.E. in Information Technology (2022 - 2026)'),
              Divider(),
              Text(
                'Technical Skills',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                  'Languages: Python, Java, C, C++, HTML, CSS, JavaScript, Flutter, Dart, MongoDB, Firebase'),
              Text(
                  'Coding Platforms: LeetCode (Contest Rating - 1400), GeeksforGeeks, InterviewBit'),
              Text(
                  'CS Fundamentals: Operating Systems, OOP, DBMS, Computer Networks'),
              Text('Developer Tools: VS Code, Android Studio'),
              Text(
                  'Technologies/Frameworks: GitHub, Git, Node.js, Express.js, Langchain, Langserve, Langsmith'),
              Divider(),
              Text(
                'Relevant Coursework',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                  'Data Structures, Algorithms Analysis, Android Development, RESTful APIs, Backend Development, Database Management, Artificial Intelligence'),
              Divider(),
              Text(
                'Achievements',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text('Smart India Hackathon Regional Selection (2023)'),
              Text('100 Days LeetCode Badge (2023, 2024)'),
              Text('50 Days LeetCode Badge (2023)'),
              Text('Devang Mehta Award for Academic Excellence (First Year)'),
              Divider(),
              Text(
                'Links',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              InkWell(
                  child: Text(
                    'LinkedIn: linkedin.com/in/ansh-shrivastav-a97520250',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () async {
                    String linkedin_link =
                        'https://linkedin.com/in/ansh-shrivastav-a97520250';

                    await launchUrl(
                        Uri.parse(
                          linkedin_link,
                        ),
                        mode: LaunchMode.inAppBrowserView);
                  }),
              InkWell(
                  child: Text(
                    'GitHub: github.com/anshshr',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    String github_link = 'https://github.com/anshshr';
                    launchUrl(Uri.parse(github_link),
                        mode: LaunchMode.inAppBrowserView);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
