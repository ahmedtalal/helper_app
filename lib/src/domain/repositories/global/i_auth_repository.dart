import 'package:saied_app/src/domain/entities/user_entity.dart';

abstract class IAuthRepository {
  dynamic login(UserEntity model);
  dynamic register(UserEntity model);
  dynamic forgetPassword(var email);
  dynamic updatePassword(var newPassword);
  dynamic logOut();
  dynamic checkIsAuth();
}
