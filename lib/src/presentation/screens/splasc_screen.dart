import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saied_app/src/presentation/logic/providers/app_theme_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("data"),
          ),
          Consumer<AppThemeProvider>(
            builder: (context, notify, child) {
              return ElevatedButton(
                onPressed: () {
                  notify.setTheme();
                },
                child: const Text("data"),
              );
            },
          )
        ],
      ),
    );
  }
}
