import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/servies/api_service.dart';

class MainController extends GetxController {
  dynamic currentWeatherData;
  dynamic fiveDayForecast;

  var lattitude = 0.0.obs;
  var longitude = 0.0.obs;

  var isLoaded = false.obs;

  Future<void> getUserLocation() async {
    LocationPermission userPermission = LocationPermission.denied;
    bool isLocationEnabled = false;

    isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) Future.error('Location Denied');

    if (userPermission == LocationPermission.deniedForever) {
      return Future.error('Location Permission Denied Permanently');
    } else if (userPermission == LocationPermission.denied) {
      userPermission = await Geolocator.requestPermission();
      if (userPermission == LocationPermission.denied) {
        return Future.error('Denied Again');
      }
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((loc) {
      lattitude.value = loc.latitude;
      longitude.value = loc.longitude;

      //Printing Coordinates
      print(loc.latitude);
      print(loc.longitude);
    });
  }

  @override
  void onInit() async {
    super.onInit();

    await getUserLocation().then(
      (value) {
        currentWeatherData =
            getCurrentWeather(lattitude: lattitude.value, longitude: longitude.value);
        fiveDayForecast =
            getFivedayForecast(lattitude: lattitude.value, longitude: longitude.value);
      },
    ).then((value) {
      isLoaded.value = true;
    });
  }
}
