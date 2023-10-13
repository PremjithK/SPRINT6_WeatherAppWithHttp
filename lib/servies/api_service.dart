import 'package:http/http.dart' as http;
import 'package:weather_app/_config/strings.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/five_day_forecast_model.dart';

getCurrentWeather({
  required double lattitude,
  required double longitude,
}) async {
  final link =
      'https://api.openweathermap.org/data/2.5/weather?lat=$lattitude&lon=$longitude&appid=$apiKey&units=metric';

  final result = await http.get(Uri.parse(link));
  if (result.statusCode == 200) {
    print(result.body);
    final data = curentWeatherFromJson(result.body.toString());
    print(data.main);
    return data;
  }
}

//5 day forecast
getFivedayForecast({
  required double lattitude,
  required double longitude,
}) async {
  final result = await http.get(
    Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$lattitude&lon=$longitude&appid=$apiKey&units=metric'),
  );
  if (result.statusCode == 200) {
    print(result.body);
    final data = fiveDayForecastFromJSON(result.body.toString());
    return data;
  }
}
