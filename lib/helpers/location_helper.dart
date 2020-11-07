const GOOGLE_API_KEY = 'AIzaSyBSA29iPMx5oDyMfWqD6T17bajugknfSW4';

class LocationHelper {
  static String generateLocationPreviousImage(
      {double latitude, double longitude}) {
        return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
      }
}
