import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getweatherByCity(String TypedCityName) async {
    try {
      NetworkHelper networkHelper = NetworkHelper(
          'https://api.openweathermap.org/data/2.5/weather?q=$TypedCityName&appid=$apiKey&units=metric');

      // '$kWeatherApi?q=$TypedCityName&appid=$apiKey&units=metric'
      var weatherData = await networkHelper.getData();
      return weatherData;
    } catch (e) {
      print('This is error printed $e');
    }
  }

  Future<dynamic> getweather() async {
    NewLocation newLocation = NewLocation();
    await newLocation.getlocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$kWeatherApi?lat=${newLocation.latitude}&lon=${newLocation.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
