import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
import 'package:saied_app/src/data/repositories/firebase/fire_auth_repository_imp.dart';
import 'package:saied_app/src/data/repositories/local/shared_repository_imp.dart';
import 'package:saied_app/src/presentation/logic/blocs/auth/auth_bloc.dart';
import 'package:saied_app/src/presentation/logic/blocs/auth_section/auth_section_bloc.dart';
=======
import 'package:saied_app/src/data/repositories/local/shared_repository_imp.dart';
import 'package:saied_app/src/presentation/logic/blocs/auth/auth_bloc.dart';
>>>>>>> c1cdf954aca0e2d19ee0fd31aa36ef4d41be91e2
import 'package:saied_app/src/presentation/logic/providers/app_theme_provider.dart';
import 'package:saied_app/src/presentation/screens/splasc_screen.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding
      .ensureInitialized(); // is used to interact with firebase engine >>
  await Firebase.initializeApp();
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
        ),
<<<<<<< HEAD
        BlocProvider<AuthSectionBloc>(
          create: (context) => AuthSectionBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(FireAuthRepositoryImp()),
=======
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
>>>>>>> c1cdf954aca0e2d19ee0fd31aa36ef4d41be91e2
        ),
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
