import 'dart:convert';

import 'package:prayer_time/core/api/http_requests.dart';
import 'package:http/http.dart' as http;

class PrayerApi extends HTTPRequests {
  final String baseLink = 'http://api.aladhan.com/v1';
  static Map<String, String> headers = {'Content-Type': 'application/json'};
  @override
  Future<http.Response> get(String route) async {
    http.Response response = await http.get(Uri.parse('baseLink$route'), headers: headers);
    return response;
  }

  @override
  Future<http.Response> getFromQuery(String route, Map<String, String> queriesList) async {
    String queries = queriesList.entries.map((e) => '${e.key}=${e.value.split(' ').join('%20')}').toList().join('&');
    print('$baseLink$route?$queries');
    http.Response response = await http.get(Uri.parse('$baseLink$route?$queries'), headers: headers);
    return response;
  }
}
