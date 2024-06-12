import 'package:airflower/data/providers.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://192.168.0.10:4000/';
Uri url(String api) => Uri.parse(baseUrl + api);

final headers = {
  "Content-Type": "application/json"
};

Future<void> fetchCondition() async {
  // await http.get(
  //   url("system/current"),
  //   headers: headers,
  // );

  // await Future.delayed(const Duration(seconds: 10));

  // fetchCondition();
}

Future<void> sendCode(int code, int timer) async {
  // await http.post(
  //   url("action/list"),
  //   headers: headers,
  //   body: '''{
  //     "ACTION_LIST": [
  //       {"ACTION_TYPE": $code, "TIMER": $timer}
  //     ]
  //   }''',
  // );
}

Future<void> setMode(Mode mode) async {
  // await http.post(
  //   url("system/mode"),
  //   headers: headers,
  //   body: '''{
  //     "MODE": ${mode.index}
  //   }''',
  // );
}
