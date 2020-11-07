import 'package:flutter_config/flutter_config.dart';

class LocationHelper {
  static String generateLocationPreviousImage({double latitude, double longitude}) {
    final googleKey = FlutterConfig.get('GOOGLE_API_KEY');
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$googleKey';
  }
}