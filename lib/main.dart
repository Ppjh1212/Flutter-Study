import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_study/firebase_account_action/account_action_screen.dart';
import 'package:login_study/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Study',
      home: Scaffold(
        body: SafeArea(
          child: AccountActionScreen(),
        ),
      ),
    );
  }
}
