class GeoPoint {
  final double latitude;
  final double longitude;
  final double? altitude;

  GeoPoint({required this.latitude, required this.longitude, this.altitude});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoPoint &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          altitude == other.altitude;

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode ^ altitude.hashCode;

  @override
  String toString() {
    return 'GeoPoint{latitude: $latitude, longitude: $longitude, altitude: $altitude}';
  }
}
