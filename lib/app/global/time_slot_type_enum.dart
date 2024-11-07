enum TimeSlotType {
  am,
  pm;

  String get name => toString().split('.').last.toUpperCase();
}