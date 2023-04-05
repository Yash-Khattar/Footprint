import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footprint/providers/googleSignIn_provider.dart';
import 'package:footprint/providers/pedometer_provider.dart';
import 'package:footprint/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PedometerProvider()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    );
  }
}
