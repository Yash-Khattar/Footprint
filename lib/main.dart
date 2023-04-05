import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footprint/providers/googleSignIn_provider.dart';
import 'package:footprint/providers/pedometer_provider.dart';
import 'package:footprint/screens/auth_screen.dart';
import 'package:footprint/screens/bottom_nav.dart';
import 'package:footprint/screens/home_screen.dart';
import 'package:footprint/screens/ngo_screen.dart';
import 'package:footprint/screens/userProfile_screen.dart';
import 'package:footprint/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PedometerProvider()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          AuthPage.id: (context) => AuthPage(),
          HomeScreen.id: (context) => HomeScreen(),
          NGOScreen.id: (context) => NGOScreen(),
          // UserProfileScreen.id: (context) => UserProfileScreen(),
          BottomNavigation.id: (context) => BottomNavigation(),
        },
        // home: WelcomeScreen(),
      ),
    );
  }
}
