// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saied_app/src/core/utils/constants.dart';
import 'package:saied_app/src/data/models/user_model.dart';
import 'package:saied_app/src/domain/entities/user_entity.dart';

class FireUserOperations {
  const FireUserOperations();
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference _collRef = _firestore.collection("Users");

  Future<Map<String, dynamic>> addUserInfo(UserEntity userModel) async {
    try {
      DocumentReference docRef = _collRef.doc(userModel.id);
      Map<String, dynamic> data = UserModel.toJson(userModel);
      await docRef.set(data);
      return {Constants.responseKey: Constants.successResponseType};
    } catch (e) {
      print("the add user error is :$e");
      return {
        Constants.responseKey: Constants.failedResponseType,
        Constants.bodyKey: e.toString()
      };
    }
  }

  Future<Map<String, dynamic>> deleteUserInfo(String userId) async {
    try {
      await _collRef.doc(userId).delete();
      return {Constants.responseKey: Constants.successResponseType};
    } catch (e) {
      print("the delete user error is :${e.toString()}");
      return {
        Constants.responseKey: Constants.failedResponseType,
        Constants.bodyKey: e.toString()
      };
    }
  }

  Future<Map<String, dynamic>> updateUserInfo(UserEntity userModel) async {
    try {
      Map<String, dynamic> data = UserModel.toJson(userModel);
      await _collRef.doc(userModel.id).update(data);
      return {Constants.responseKey: Constants.successResponseType};
    } catch (e) {
      print("the update user error is :${e.toString()}");
      return {
        Constants.responseKey: Constants.failedResponseType,
        Constants.bodyKey: e.toString()
      };
    }
  }

  Future<Map<String, dynamic>> getSpecialUser(String userId) async {
    try {
      DocumentSnapshot docSanp = await _collRef.doc(userId).get();
      dynamic data = docSanp.data();
      UserModel userModel = UserModel.fromJson(data);
      print("the user name is :${userModel.name}");
      return {
        Constants.responseKey: Constants.successResponseType,
        Constants.bodyKey: userModel
      };
    } catch (e) {
      print("the get special user error is :${e.toString()}");
      return {
        Constants.responseKey: Constants.failedResponseType,
        Constants.bodyKey: e.toString()
      };
    }
  }

  Future<Map<String, dynamic>> getAllUsers() async {
    try {
      List<UserModel> users = [];
      QuerySnapshot querySnap = await _collRef.get();
      for (var element in querySnap.docs) {
        dynamic data = element.data();
        users.add(UserModel.fromJson(data));
      }
      print({"the first user is ${users[0].name}"});
      return {
        Constants.responseKey: Constants.successResponseType,
        Constants.bodyKey: users
      };
    } catch (e) {
      print('the get all users error is :${e.toString()}');
      return {
        Constants.responseKey: Constants.failedResponseType,
        Constants.bodyKey: e.toString()
      };
    }
  }
}
