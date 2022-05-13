// ignore_for_file: avoid_print
import 'package:saied_app/src/core/utils/constants.dart';
import 'package:saied_app/src/data/sources/firebase/fire_auth_operations.dart';
import 'package:saied_app/src/domain/entities/user_entity.dart';
import 'package:saied_app/src/domain/repositories/global/i_auth_repository.dart';

class FireAuthRepositoryImp implements IAuthRepository {
  final FireAuthOperations _fAuthOperations = const FireAuthOperations();
  @override
  Map<String, dynamic> checkIsAuth() {
    return {
      Constants.responseKey: Constants.successResponseType,
      Constants.bodyKey: _fAuthOperations.fireCheckIsAuth()
    };
  }

  @override
  Future<Map<String, dynamic>> forgetPassword(email) async {
    return await _fAuthOperations.fireResetPassword(email);
  }

  @override
  Future<Map<String, dynamic>> logOut() async {
    return await _fAuthOperations.fireLogOut();
  }

  @override
  Future<Map<String, dynamic>> login(UserEntity model) async {
    return await _fAuthOperations.fireLogin(model);
  }

  @override
  Future<Map<String, dynamic>> register(UserEntity model) async {
    print("the user name is ${model.name}");
    return await _fAuthOperations.fireRegister(model);
  }

  @override
  updatePassword(newPassword) async {
    await _fAuthOperations.fireUpdatePassword(newPassword);
  }
}
