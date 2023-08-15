import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zaad/state/auth/backend/authenticator.dart';
import 'firebase_options.dart';

Future<void> main() async {
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
      debugShowCheckedModeBanner: false,
      title: 'ZaaD',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ZaaD",
        ),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                final result = await Authenticator().loginWithGoogle();
                log(result.toString());
              },
              child: const Text("Sign In With Google")),
          TextButton(
              onPressed: () {}, child: const Text("Sign In With Facebook")),
        ],
      ),
    );
  }
}
