import 'package:saied_app/src/domain/entities/user_entity.dart';

abstract class IuserRepository {
  dynamic addUser(UserEntity model);
  dynamic deleteUser(String userId);
  dynamic updateUser(UserEntity model);
  dynamic searchAboutUser(var index);
  dynamic displayAllUsers();
  dynamic displaySPecialUser(var index);
}
