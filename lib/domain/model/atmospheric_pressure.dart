class AtmosphericPressure {
  final double pressure;
  final AtmosphericPressureUnit unit;

  AtmosphericPressure({required this.pressure, required this.unit});
}

enum AtmosphericPressureUnit {
  pa,
  hPa,
  kPa,
  mbar,
  atm,
  psi,
  mmHg,
  inHg,
}