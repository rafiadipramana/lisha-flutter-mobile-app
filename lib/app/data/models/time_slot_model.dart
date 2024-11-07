import '../../global/time_slot_type_enum.dart';

class TimeSlotModel {
  final String time;
  final int duration;
  final bool isAvailable;
  final TimeSlotType type;

  TimeSlotModel({
    required this.time,
    required this.duration,
    required this.isAvailable,
    required this.type,
  });

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) {
    return TimeSlotModel(
      time: json['time'],
      duration: json['duration'],
      // TODO: Fix this
      // isAvailable: json['is_available'],
      isAvailable: true,
      type: TimeSlotType.values.firstWhere(
        (TimeSlotType element) => element.name.toLowerCase() == json['time_period'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'duration': duration,
      'is_available': isAvailable,
      'time_period': type.name,
    };
  }
}