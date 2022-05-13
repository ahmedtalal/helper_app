import 'package:saied_app/src/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    name,
    id,
    email,
    password,
    photo,
  }) : super(
          name: name,
          id: id,
          email: email,
          password: password,
          photo: photo,
        );

  // UserModel.login({required email, required password});
  // UserModel.register({
  //   required name,
  //   required email,
  //   required password,
  //   required photo,
  // });

  factory UserModel.fromJson(Map<String, dynamic> userMap) {
    return UserModel(
      name: userMap["userName"],
      id: userMap["userId"],
      email: userMap["userEmail"],
      photo: userMap["userImage"],
    );
  }

  static Map<String, dynamic> toJson(UserEntity userModel) => {
        "userName": userModel.name,
        "userId": userModel.id,
        "userEmail": userModel.email,
        "userImage": userModel.photo,
      };
}
