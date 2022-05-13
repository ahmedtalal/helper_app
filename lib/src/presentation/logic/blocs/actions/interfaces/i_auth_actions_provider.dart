import 'package:flutter/material.dart';

abstract class IAuthActionsProvider {
  onRegisterClick(BuildContext context,GlobalKey<FormState> key,var model);
  onLoginClick(BuildContext context,GlobalKey<FormState> key,var model);
  onResetPasswordClick(BuildContext context,String newPassword);
  onLogOutClick(BuildContext context);
}



