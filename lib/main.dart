import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saied_app/src/core/utils/constants.dart';
import 'package:saied_app/src/data/repositories/local/shared_repository_imp.dart';
import 'package:saied_app/src/presentation/logic/providers/app_theme_provider.dart';

import 'src/presentation/screens/splasc_screen.dart';

void main(List<String> args) {
  runApp(const SaiedApp());
}

class SaiedApp extends StatelessWidget {
  const SaiedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppThemeProvider(const SharedRepositoryImp()),
        )
      ],
      child: Consumer<AppThemeProvider>(
        builder: (context, notify, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: notify.switchThemeMode(),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
