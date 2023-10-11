import 'package:flutter/material.dart';
import 'package:flutter_mid_level/view/splash_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
late SharedPreferences pref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
          textTheme: const TextTheme(
              bodyLarge: TextStyle(
                fontFamily: 'lora',
              ),
              bodyMedium: TextStyle(
                fontFamily: 'lora',
              )),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black),
      themeMode: ThemeMode.dark,
      home:const Splash(),
    );
  }
}
