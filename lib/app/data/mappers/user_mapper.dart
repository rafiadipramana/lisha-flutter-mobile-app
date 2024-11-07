import '../models/user_model.dart';
import '../../domain/entities/user.dart';

class UserMapper {
  static User fromModel(UserModel model) {
    return User(
      id: model.id,
      uid: model.uid,
      firstName: model.firstName,
      lastName: model.lastName,
      country: model.country,
      profileImageUrl: model.profileImageUrl,
      role: model.role,
    );
  }

  static UserModel fromEntity(User entity) {
    return UserModel(
      id: entity.id,
      uid: entity.uid,
      firstName: entity.firstName,
      lastName: entity.lastName,
      country: entity.country,
      profileImageUrl: entity.profileImageUrl,
    );
  }

  static List<User> fromModelList(List<UserModel> models) {
    return models.map((model) => fromModel(model)).toList();
  }

  static List<UserModel> toModelList(List<User> entities) {
    return entities.map((entity) => fromEntity(entity)).toList();
  }
}