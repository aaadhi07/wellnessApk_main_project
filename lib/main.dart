import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main_project_ui/conroler/login_screen_controller.dart';
import 'package:main_project_ui/conroler/registration_screen_controler.dart';
import 'package:main_project_ui/firebase_options.dart';
// import 'package:main_project_ui/view/meditation_screen/meditation_screen.dart';
import 'package:main_project_ui/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => RegistrationScreenControler(),
    ),
    ChangeNotifierProvider(
      create: (context) => LoginScreenController(),
    )
  ], child: WellnessApp()));
}

class WellnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
