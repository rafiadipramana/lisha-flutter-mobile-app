import 'package:lisha/app/data/models/appointment_model.dart';

import '../../domain/entities/appoitment.dart';

class AppointmentMapper {
  static Appointment fromModel(AppointmentModel model) {
    return Appointment(
      id: model.id,
      freelancerId: model.freelancerId,
      clientId: model.clientId,
      time: model.time,
      date: model.date,
      createdAt: model.createdAt,
      fullName: model.fullName,
      email: model.email,
      guests: model.guests,
      description: model.description,
    );
  }

  static AppointmentModel fromEntity(Appointment entity) {
    return AppointmentModel(
      id: entity.id,
      freelancerId: entity.freelancerId,
      clientId: entity.clientId,
      time: entity.time,
      date: entity.date,
      createdAt: entity.createdAt,
      fullName: entity.fullName,
      email: entity.email,
      guests: entity.guests,
      description: entity.description,
    );
  }

  static List<Appointment> fromModelList(List<AppointmentModel> models) {
    return models.map((model) => fromModel(model)).toList();
  }

  static List<AppointmentModel> toModelList(List<Appointment> entities) {
    return entities.map((entity) => fromEntity(entity)).toList();
  }
}