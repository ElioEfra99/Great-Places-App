import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocationHelper {
  static String generateLocationPreviousImage({double latitude, double longitude}) {
    final googleKey = DotEnv().env['GOOGLE_API_KEY'];
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$googleKey';
  }
}