import 'package:airflower/data/p_settings.dart';
import 'package:airflower/data/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://192.168.0.9:4000/';
Uri url(String api) => Uri.parse(baseUrl + api);

final headers = {
  "Content-Type": "application/json"
};

Future<void> fetchCondition() async {
  final response = await http.get(
    url("system/current"),
    headers: headers,
  );

  print(response.body);

  await Future.delayed(const Duration(seconds: 10));

  fetchCondition();
}

Future<void> sendConfig(String json) async {
  final response = await http.post(
    url("system/current"),
    headers: headers,
    body: json,
  );
}
