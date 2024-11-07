import '../../global/time_slot_type_enum.dart';

class TimeSlot {
  final String time;
  final int duration;
  final bool isAvailable;
  final TimeSlotType type;

  TimeSlot({
    required this.time,
    required this.duration,
    required this.isAvailable,
    required this.type,
  });

  static TimeSlot empty() {
    return TimeSlot(
      time: '01:00',
      duration: 0,
      isAvailable: false,
      type: TimeSlotType.am,
    );
  }

  TimeSlot copyWith({
    String? time,
    int? duration,
    bool? isAvailable,
    TimeSlotType? type,
  }) {
    return TimeSlot(
      time: time ?? this.time,
      duration: duration ?? this.duration,
      isAvailable: isAvailable ?? this.isAvailable,
      type: type ?? this.type,
    );
  }
  
  // Parse the current time string into hours and minutes
  (int hours, int minutes) _parseTime() {
    final parts = time.split(':');
    return (int.parse(parts[0]), int.parse(parts[1]));
  }

  // Format time ensuring proper padding
  static String _formatTime(int hours, int minutes) {
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  // Add duration in minutes and return new TimeSlot
  TimeSlot addDuration(int durationInMinutes) {
    final (currentHours, currentMinutes) = _parseTime();
    
    // Calculate total minutes
    int totalMinutes = currentHours * 60 + currentMinutes + durationInMinutes;
    
    // Calculate new hours and minutes
    int newHours = (totalMinutes ~/ 60) % 12;
    int newMinutes = totalMinutes % 60;
    
    // Handle midnight/noon cases
    if (newHours == 0) newHours = 12;
    
    // Determine if we need to switch between AM/PM
    TimeSlotType newType = type;
    if (totalMinutes >= 12 * 60) {
      newType = type == TimeSlotType.am ? TimeSlotType.pm : TimeSlotType.am;
    }

    return TimeSlot(
      time: _formatTime(newHours, newMinutes),
      duration: duration,
      isAvailable: isAvailable,
      type: newType,
    );
  }
}

// Fixed list generators with proper hour formatting
List<TimeSlot> dummyAfterMidnightTimeSlots = List<TimeSlot>.generate(
  12,
  (index) => TimeSlot(
    time: TimeSlot._formatTime(index + 1, 0),  // Using the _formatTime helper
    duration: 0,
    isAvailable: true,
    type: TimeSlotType.am,
  ),
);

List<TimeSlot> dummyPastMidnightTimeSlots = List<TimeSlot>.generate(
  12,
  (index) => TimeSlot(
    time: TimeSlot._formatTime(index + 1, 0),  // Using the _formatTime helper
    duration: 0,
    isAvailable: true,
    type: TimeSlotType.pm,
  ),
);