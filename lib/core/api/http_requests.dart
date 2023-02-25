import 'package:http/http.dart';

abstract class HTTPRequests {
  Future<Response> get(String route);
  Future<Response> getFromQuery(String route, Map<String, String> queriesList);
}
