import '../services/networking.dart';
import '../location_modal.dart';

const apiKey = '1a30de7d5832f01bb008457df94346e7';
const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  NetworkHelper _networkHelper;

  Future<dynamic> getLocationWeather() async {
    Location _userLocation = new Location();
    await _userLocation.getCurrentLocation();

    _networkHelper = new NetworkHelper(
        '$baseUrl?lat=${_userLocation.latitude}&lon=${_userLocation.longitude}&units=imperial&appid=$apiKey');

    var weatherData = await _networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityNAme) async {
    var url = '$baseUrl?q=$cityNAme&units=imperial&appid=$apiKey';

    _networkHelper = new NetworkHelper(url);

    var weather = await _networkHelper.getData();
    return weather;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
