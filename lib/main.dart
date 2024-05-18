import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notes/pages/add_note.dart';
import 'package:notes/pages/auth_page.dart';
import 'package:notes/pages/notes_page.dart';
import 'firebase_options.dart';
import 'package:notes/pages/login_page.dart';
import 'package:notes/pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      routes: {
        '/login_page': (context) => const LoginPage(),
        '/signup_page': (context) => SignupPage(),
        '/notes_page': (context) => const NotesPage(),
        '/add_note': (context) => const AddNote(),
      },
      title: "My Notes",
    );
  }
}
