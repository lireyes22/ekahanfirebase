import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> fetchAirQualityData(double latitude, double longitude) async {
  const String apiKey = 'AIzaSyCkE9onX-k5zxV7RAuKAvBZI9878oJluek';
  const String apiUrl =
      'https://airquality.googleapis.com/v1/currentConditions:lookup?key=$apiKey';

  final Map<String, dynamic> requestData = {
    "location": {"latitude": latitude, "longitude": longitude}
  };

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(requestData),
  );

  if (response.statusCode == 200) {
    // Analizar la respuesta JSON
    final dynamic data = jsonDecode(response.body);
    String cdn = data.toString();
    cdn = cdn.substring(cdn.indexOf('category:') + 10);
    cdn = cdn.substring(0, cdn.indexOf(','));
    return cdn;
  } else {
    // Manejar errores
    return 'error';
  }
}
