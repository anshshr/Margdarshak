// ignore_for_file: prefer_const_declarations, non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:copy_of_margdrashak/gemini/secrets.dart';
import 'package:http/http.dart' as http;

Future<dynamic> fetchYouTubeSearchResults(searchQuery) async {
  // final apiKey =
  //     'ecb0f7cc1cbba52f415996748a48cbbefff008aa2e2daa696a64e143e240ec4c';
  final apiKey = serp_api_key;
  // final searchQuery = serch_query + 'programming courses';
  final url = Uri.parse(
      'https://serpapi.com/search.json?engine=youtube&search_query=$searchQuery&api_key=$apiKey');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    return jsonResponse['video_results'];
    print(jsonResponse['video_results'][0]['link']);
  } else {
    print('Request failed with status: ${response.statusCode}');
    return [
      {
        'error': 'unable to fetch data',
        'status code ': response.statusCode,
      }
    ];
  }
}
