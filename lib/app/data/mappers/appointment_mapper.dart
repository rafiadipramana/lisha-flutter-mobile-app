import 'package:lisha/app/data/mappers/time_slot_mapper.dart';
import 'package:lisha/app/data/mappers/user_mapper.dart';
import 'package:lisha/app/data/models/appointment_model.dart';

import '../../domain/entities/appointment.dart';

class AppointmentMapper {
  static Appointment fromModel(AppointmentModel model) {
    return Appointment(
      id: model.id,
      freelancerId: model.freelancerId,
      clientId: model.clientId,
      time: TimeSlotMapper.fromModel(model.time),
      date: model.date,
      createdAt: model.createdAt,
      fullName: model.fullName,
      email: model.email,
      guests: model.guests,
      description: model.description,
      freelancer: model.freelancer != null ? UserMapper.fromModel(model.freelancer!) : null,
      client: model.client != null ? UserMapper.fromModel(model.client!) : null,
    );
  }

  static AppointmentModel fromEntity(Appointment entity) {
    return AppointmentModel(
      id: entity.id,
      freelancerId: entity.freelancerId,
      clientId: entity.clientId,
      time: TimeSlotMapper.fromEntity(entity.time),
      date: entity.date,
      createdAt: entity.createdAt,
      fullName: entity.fullName,
      email: entity.email,
      guests: entity.guests,
      description: entity.description,
      freelancer: entity.freelancer != null ? UserMapper.fromEntity(entity.freelancer!) : null,
      client: entity.client != null ? UserMapper.fromEntity(entity.client!) : null,
    );
  }

  static List<Appointment> fromModelList(List<AppointmentModel> models) {
    return models.map((model) => fromModel(model)).toList();
  }

  static List<AppointmentModel> toModelList(List<Appointment> entities) {
    return entities.map((entity) => fromEntity(entity)).toList();
  }
}