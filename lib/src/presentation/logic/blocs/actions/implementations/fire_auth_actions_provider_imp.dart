import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../interfaces/i_auth_actions_provider.dart';
import '../../auth/auth_bloc.dart';
import '../../auth/auth_events.dart';

class FireAuthActionsProviderImp implements IAuthActionsProvider {
  @override
  onLogOutClick(BuildContext context) {
    // TODO: implement onLogOutClick
    throw UnimplementedError();
  }

  @override
  onLoginClick(BuildContext context, GlobalKey<FormState> key, model) {
    // TODO: implement onLoginClick
    throw UnimplementedError();
  }

  @override
  onRegisterClick(BuildContext context, GlobalKey<FormState> key, model) {
    if (key.currentState!.validate()) {
      context.read<AuthBloc>().model = model;
      print("the name is ${context.read<AuthBloc>().model.name}");
      context.read<AuthBloc>().add(RegisterEvent());
    } else {}
  }

  @override
  onResetPasswordClick(BuildContext context, String newPassword) {
    // TODO: implement onResetPasswordClick
    throw UnimplementedError();
  }
}
