class Speed {
  final double speed;
  final SpeedUnit unit;

  Speed({required this.speed, required this.unit});
}

enum SpeedUnit {
  mph,
  kmph,
}