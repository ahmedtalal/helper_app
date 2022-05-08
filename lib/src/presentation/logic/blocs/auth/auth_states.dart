import 'package:flutter/material.dart';
import 'package:saied_app/src/core/utils/constants.dart';
import 'package:saied_app/src/presentation/screens/auth/auth_screen.dart';
import 'package:saied_app/src/presentation/screens/home_Screen.dart';
import 'package:saied_app/src/presentation/screens/splasc_screen.dart';

abstract class AuthStates {
  const AuthStates();
}

class AuthInitialState extends AuthStates {
  const AuthInitialState();
  Widget initialLoadingState() => const CircularProgressIndicator(
        strokeWidth: 1,
        color: Colors.blueGrey,
      );
}

class AuthLoadedState extends AuthStates {
  const AuthLoadedState();
  void afterSuccessAuth(BuildContext context) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
}

class AuthLoadingState extends AuthStates {
  const AuthLoadingState();
  Widget authLoadingOperation() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(height: 5),
          Text(
            "Please Wait",
            style: TextStyle(
              fontSize: 16,
              fontFamily: Constants.fontApp,
            ),
          ),
        ],
      );
}

class AuthErrorState extends AuthStates {
  final String? error;
  const AuthErrorState({required this.error});
  Widget errorAuthOperation() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.highlight_remove_rounded,
            color: Colors.red,
            size: 20,
          ),
          const SizedBox(height: 8),
          Text(
            error!,
            style: const TextStyle(
              fontFamily: Constants.fontApp,
              fontSize: 16,
            ),
          ),
        ],
      );
}

class LogOutAuthState extends AuthStates {
  const LogOutAuthState();
  void afterLogedOut(BuildContext context) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ),
      );
}

class SuccessUpdatePasswordState extends AuthStates {
  const SuccessUpdatePasswordState();
  void afterSuccessAuth(BuildContext context) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        ),
      );
}
