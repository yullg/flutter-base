class Coordinate {
  final double x;
  final double y;
  final double? z;

  Coordinate({required this.x, required this.y, this.z});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Coordinate && runtimeType == other.runtimeType && x == other.x && y == other.y && z == other.z;

  @override
  int get hashCode => x.hashCode ^ y.hashCode ^ z.hashCode;

  @override
  String toString() {
    return 'Coordinate{x: $x, y: $y, z: $z}';
  }
}
