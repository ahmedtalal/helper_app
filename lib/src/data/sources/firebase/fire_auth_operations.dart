// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:saied_app/src/core/utils/constants.dart';
import 'package:saied_app/src/data/sources/firebase/fire_user_operations.dart';
import 'package:saied_app/src/domain/entities/user_entity.dart';

import '../../models/user_model.dart';

class FireAuthOperations {
  const FireAuthOperations();
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static const FireUserOperations _fUserOperations = FireUserOperations();

  Future<Map<String, dynamic>> fireLogin(UserEntity model) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: model.email!, password: model.password!);
      return {
        "response": Constants.successResponseType,
        "body": userCredential.user
      };
    } on FirebaseAuthException catch (e) {
      return {"response": Constants.fireAuthException, "body": e.code};
    } catch (e) {
      return {"response": Constants.failedResponseType, "body": e.toString()};
    }
  }

  Future<Map<String, dynamic>> fireRegister(UserEntity model) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: model.email!, password: model.password!);
      UserModel userModel = _prepareObject(model, userCredential.user!.uid);
      // CALL ADDUSER METHOD IN HERE TO ADD USER AFTER COMPLETE REGISTER METHOD
      final result = await _fUserOperations.addUserInfo(userModel);
      print("the register success is :${result[Constants.responseKey]}");
      return result;
    } on FirebaseAuthException catch (e) {
      return {
        Constants.responseKey: Constants.fireAuthException,
        Constants.bodyKey: e.code
      };
    } catch (e) {
      return {
        Constants.responseKey: Constants.failedResponseType,
        Constants.bodyKey: e.toString()
      };
    }
  }

  Future<Map<String, dynamic>> fireLogOut() async {
    try {
      await _auth.signOut();
      return {
        Constants.responseKey: Constants.successResponseType,
        Constants.bodyKey: true
      };
    } catch (e) {
      print("the logout error is ${e.toString()}");
      return {
        Constants.responseKey: Constants.failedResponseType,
        Constants.bodyKey: e.toString()
      };
    }
  }

  bool fireCheckIsAuth() {
    if (_auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<Map<String, dynamic>> fireUpdatePassword(var newPassword) async {
    try {
      await _auth.currentUser!.updatePassword(newPassword);
      return {
        Constants.responseKey: Constants.successResponseType,
        Constants.bodyKey: true
      };
    } on FirebaseAuthException catch (e) {
      return {
        Constants.responseKey: Constants.failedResponseType,
        Constants.bodyKey: e.toString()
      };
    } catch (e) {
      return {
        Constants.responseKey: Constants.failedResponseType,
        Constants.bodyKey: e.toString()
      };
    }
  }

  Future<Map<String, dynamic>> fireResetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return {
        Constants.responseKey: Constants.successResponseType,
        Constants.bodyKey: true
      };
    } on FirebaseAuthException catch (e) {
      return {
        Constants.responseKey: Constants.failedResponseType,
        Constants.bodyKey: e.code
      };
    } catch (e) {
      return {
        Constants.responseKey: Constants.failedResponseType,
        Constants.bodyKey: e.toString()
      };
    }
  }

// SPECIAL METHOD BELONGS TO THIS CLASS
  UserModel _prepareObject(model, String userId) {
    UserModel userModel = UserModel(
      name: model.name,
      id: userId,
      email: model.email,
      photo: model.photo,
    );
    return userModel;
  }
}
