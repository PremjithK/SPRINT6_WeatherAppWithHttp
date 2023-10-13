import 'package:get/get.dart';
import 'package:weather_app/servies/api_service.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    currentWeatherData = getCurrentWeather(lattitude: 11.2588, longitude: 75.7804);
    fiveDayForecast = getFivedayForecast(lattitude: 11.2588, longitude: 75.7804);
  }

  dynamic currentWeatherData;
  dynamic fiveDayForecast;
}
