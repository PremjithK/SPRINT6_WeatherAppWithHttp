import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/_config/layouts.dart';
import 'package:weather_app/_config/text_styles.dart';
import 'package:weather_app/_widgets/additional_stats.dart';
import 'package:weather_app/_widgets/city_name.dart';
import 'package:weather_app/_widgets/forecast_card.dart';
import 'package:weather_app/_widgets/main_weather_container.dart';
import 'package:weather_app/_widgets/spacer.dart';
import 'package:weather_app/controllers/main_controller.dart';
import 'package:weather_app/models/current_weather_model.dart' as current_weather;
import 'package:weather_app/models/five_day_forecast_model.dart' as forecast;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        toolbarHeight: 50,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Weather App')
                .text
                .fontWeight(FontWeight.bold)
                .color(Colors.white.withOpacity(0.85))
                .letterSpacing(-0.5)
                .make(),
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(Icons.refresh, color: Colors.white.withOpacity(0.85))),
          ],
        ),
        shadowColor: Colors.deepOrange.withOpacity(0.2),
        elevation: 2,
      ),
      body: SafeArea(
        child: (controller.isLoaded.value == true)
            ? FutureBuilder(
                future: controller.currentWeatherData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // print(snapshot.data);
                    final data = snapshot.data as current_weather.CurrentWeatherData;
                    print(data.weather[0].main.toUpperCase());
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          hSpacer(12),
                          LocationInfo(
                            locationName: data.name,
                            time: '${DateTime.now().hour}:${DateTime.now().minute} ',
                          ),
                          MainWeatherDisplay(
                            temp: data.main.temp,
                            condition: data.weather[0].main.capitalized,
                          ),
                          hSpacer(6),
                          AdditionalStats(
                            windSpeed: data.wind.speed.toString(),
                            humidity: data.main.humidity.toString(),
                            maxTemp: data.main.tempMax.toString(),
                            minTemp: data.main.tempMin.toString(),
                          ).px(6),
                          hSpacer(12),
                          Row(
                            children: [
                              const Text('Forecast 5d')
                                  .text
                                  .fontWeight(FontWeight.bold)
                                  .size(TextSize.h5)
                                  .make(),
                            ],
                          ).px(GlobalInsets.containerMargin + 3),

                          //? Inner future builder
                          FutureBuilder(
                            future: controller.fiveDayForecast,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final forecastData = snapshot.data as forecast.FivedayForecastData;

                                return SizedBox(
                                  height: 250,
                                  child: ListView.builder(
                                    itemCount: forecastData.list.length,
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return ForecastCard(
                                        day: forecastData.list[index].dtTxt.toString(),
                                        condition: forecastData.list[index].weather[0].main.name,
                                        time: DateFormat.jm().format(
                                            DateTime.fromMicrosecondsSinceEpoch(
                                                forecastData.list[index].dt.toInt() * 1000)),
                                        temp: forecastData.list[index].main.temp.toInt().toString(),
                                      );
                                    },
                                  ),
                                );
                              } else if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.deepOrange,
                                    strokeWidth: 7,
                                    strokeCap: StrokeCap.round,
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                          //? End of Inner FutureBuilder
                        ],
                      ).px(16),
                    );
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepOrange,
                        strokeWidth: 7,
                        strokeCap: StrokeCap.round,
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.warning_rounded,
                            color: Colors.orange,
                            size: 36,
                          ),
                          wSpacer(5),
                          const Text('Unable to retrieve weather data')
                              .text
                              .size(TextSize.b2)
                              .color(Colors.grey.shade600)
                              .lineHeight(0)
                              .make(),
                        ],
                      ),
                    );
                  }
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
