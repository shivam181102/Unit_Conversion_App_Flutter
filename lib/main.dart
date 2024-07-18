import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'package:unit_conversion/Pages/home.dart';

import 'package:unit_conversion/features/app/splash_screen/splash_screen.dart';
import 'package:unit_conversion/firebase_options.dart';
import 'package:unit_conversion/user_auth/presentation/pages/login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(
        child: Login(),
      ),
    );
  }
}
