import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Position _position;

  Future<void> getCurrentLocation() async {
    try {
      _position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = _position.latitude;
      longitude = _position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
