import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkService {
  static String url = "https://api.openai.com/v1/chat/completions";
  static String token = "";

  static Future<String> sendResponse(String chat) async {
    // Create the request headers
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    // Create the request body
    Map<String, dynamic> body = {
      'model': 'gpt-3.5-turbo',
      'messages': [
        {
          "role": 'user',
          'content': chat,
        }
      ]
    };

    // Make the HTTP POST request
    var response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(body));

    // Handle the response
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var generatedText = data['choices'][0]['message']['content'];
      return generatedText;
    } else {
      throw Exception('Failed to generate text.');
    }
  }
}
