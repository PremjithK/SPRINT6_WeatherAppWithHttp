// API STRINGS
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String apiKey = dotenv.env['API_KEY'].toString();
const String currentEndPoint =
    'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}';
const String forecastEndpoint =
    'https://api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={API key}';

//Co-ordinates
const double lat = 74.3456;
const double lon = 11.2456;
