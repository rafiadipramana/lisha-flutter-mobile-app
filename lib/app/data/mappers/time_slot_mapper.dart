import 'package:lisha/app/data/models/time_slot_model.dart';
import 'package:lisha/app/domain/entities/time_slot.dart';

class TimeSlotMapper {
  static TimeSlot fromModel(TimeSlotModel model) {
    return TimeSlot(
      time: model.time,
      duration: model.duration,
      isAvailable: model.isAvailable,
      type: model.type,
    );
  }

  static TimeSlotModel fromEntity(TimeSlot entity) {
    return TimeSlotModel(
      time: entity.time,
      duration: entity.duration,
      isAvailable: entity.isAvailable,
      type: entity.type,
    );
  }

  static List<TimeSlot> fromModelList(List<TimeSlotModel> models) {
    return models.map((model) => fromModel(model)).toList();
  }

  static List<TimeSlotModel> toModelList(List<TimeSlot> entities) {
    return entities.map((entity) => fromEntity(entity)).toList();
  }
}