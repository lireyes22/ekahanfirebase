import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PruebaScreen extends StatefulWidget {
  const PruebaScreen({Key? key}) : super(key: key);
  static const String routeName = '/prueba';
  @override
  State<PruebaScreen> createState() => _PruebaScreenState();
}

class _PruebaScreenState extends State<PruebaScreen> {
  final apiKey = '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';
  final prompt =
      "Translate the following English text to French: 'Hello, how are you?'";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: callOpenAI(apiKey, prompt),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No data'); // Manejo cuando no hay datos
        } else {
          final translatedText =
              snapshot.data!['choices'][0]['message']['content'];

          return Text(translatedText);
        }
      },
    );
  }
}

Future<Map<String, dynamic>> callOpenAI(String apiKey, String prompt) async {
  final uri =
      Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions');
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };
  final data = {
    'model': 'gpt-3.5-turbo',
    'messages': [
      {'role': 'system', 'content': 'You are a helpful assistant.'},
      {'role': 'user', 'content': prompt},
    ],
  };

  final response = await http.post(
    uri,
    headers: headers,
    body: json.encode(data),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to call OpenAI API');
  }
}
