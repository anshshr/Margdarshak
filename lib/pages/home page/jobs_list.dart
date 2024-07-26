// ignore_for_file: prefer_const_constructors

import 'package:copy_of_margdrashak/extra%20operations/job_api.dart';
import 'package:copy_of_margdrashak/pages/home%20page/jobs_details.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobDisplayPage extends StatefulWidget {
  const JobDisplayPage({super.key});

  @override
  State<JobDisplayPage> createState() => _JobDisplayPageState();
}

class _JobDisplayPageState extends State<JobDisplayPage> {
  List courses = [];
  List<List<dynamic>> data = [];
  bool isloaded = false;

  Future get_job_details() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    courses = pref.getStringList('courses selected') ?? [];
    print(courses);

    int n = courses.length;
    data = List.generate(n, (_) => []);

    for (int i = 0; i < n; i++) {
      List<dynamic> job_data = await get_jobs(courses[i] ?? []);
      setState(() {
        data[i].addAll(job_data);
      });
    }
    print(data);
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    get_job_details();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.cyan[100]!,
              Colors.cyan[200]!,
              Colors.cyan[300]!,
              Colors.cyan[400]!,
            ])),
        child: Padding(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: isloaded == true
                ? Column(
                    children: <Widget>[
                      Text(
                        'Personalized jobs according to your convenience and skill preference',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: data.length,
                          itemBuilder: (context, outerindex) {
                            return Column(
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      " ${courses[outerindex]} Developer ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: data[outerindex].length,
                                  itemBuilder: (context, innerindex) {
                                    return Card(
                                      shadowColor: Colors.grey,
                                      borderOnForeground: true,
                                      color: Colors.white,
                                      elevation: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.all(13),
                                        child: InkWell(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              //job title
                                              Text(
                                                "⭐⭐ ${data[outerindex][innerindex]['title']}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              //company name
                                              Text(
                                                data[outerindex][innerindex]
                                                    ['company_name'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              //location
                                              Text(
                                                data[outerindex][innerindex]
                                                    ['location'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            String apply_job_link =data[outerindex][innerindex]['related_links'][0]['link'];
                                            String comp_name = data[outerindex][innerindex]['company_name'];  
                                            String desc = data[outerindex][innerindex]['description']; 
                                            String job_location =data[outerindex][innerindex]['location'];         
                                            String job_thumbanil =data[outerindex][innerindex]['thumbnail'];
                                            String job_title = data[outerindex][innerindex]['job_highlights'][0]['items'][0];
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => JobsDetails(
                                                      apply_link: apply_job_link != null &&
                                                              apply_job_link
                                                                  .isNotEmpty
                                                          ? apply_job_link
                                                          : 'https://www.naukri.com/random-jobs',
                                                      company_name:
                                                          comp_name != null && comp_name.isNotEmpty
                                                              ? comp_name
                                                              : 'Not Specified',
                                                      description: desc != null &&
                                                              desc.isNotEmpty
                                                          ? desc
                                                          : 'Not provided',
                                                      location: job_location != null && job_location.isNotEmpty
                                                          ? job_location
                                                          : 'Remote',
                                                      thumbnail_url:
                                                          job_thumbanil != null && job_thumbanil.isNotEmpty
                                                              ? job_thumbanil
                                                              : 'https://thumbs.dreamstime.com/b/job-search-to-find-try-out-different-jobs-career-change-starting-new-292355991.jpg',
                                                      title: job_title != null &&
                                                              job_title.isNotEmpty
                                                          ? job_title
                                                          : 'No title specified'),
                                                ));
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                          'https://lottie.host/22d029c0-b679-4c06-8dd9-13759805b7dc/v7pAJygsg6.json',
                          height: 300,
                          width: 300),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'LOOKING FOR JOBS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.5,
                            color: Colors.black87),
                      )
                    ],
                  ))),
      ),
    );
  }
}
