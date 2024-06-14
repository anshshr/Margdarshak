// ignore_for_file: prefer_const_declarations, non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchYouTubeSearchResults(searchQuery) async {
  final apiKey =
      '78691335c33512b7e3fb6cc06e5b8bef381b99ca05f63235e555609b3a2e9ebe';
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
    return [{
      'error' : 'unable to fetch data',
      'status code ' : response.statusCode,
    }];
  }
}
