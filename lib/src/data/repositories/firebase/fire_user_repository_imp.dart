import 'package:saied_app/src/data/sources/firebase/fire_user_operations.dart';
import 'package:saied_app/src/domain/entities/user_entity.dart';
import 'package:saied_app/src/domain/repositories/global/i_user_repository.dart';

class FireUserRepositoryImp implements IuserRepository {
  final FireUserOperations _userOperations = const FireUserOperations();

  @override
  Future<Map<String, dynamic>> addUser(UserEntity model) async {
    return await _userOperations.addUserInfo(model);
  }

  @override
  Future<Map<String, dynamic>> deleteUser(String userId) async {
    return await _userOperations.deleteUserInfo(userId);
  }

  @override
  Future<Map<String, dynamic>> displayAllUsers() async {
    return await _userOperations.getAllUsers();
  }

  @override
  Future<Map<String, dynamic>> displaySPecialUser(index) async {
    return await _userOperations.getSpecialUser(index);
  }

  @override
  Future<Map<String, dynamic>> searchAboutUser(index) async {
    return await _userOperations.getSpecialUser(index);
  }

  @override
  Future<Map<String, dynamic>> updateUser(UserEntity model) async {
    return await _userOperations.updateUserInfo(model);
  }
}
