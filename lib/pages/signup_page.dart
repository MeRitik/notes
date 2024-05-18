import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  void _logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _logOut,
          icon: const Icon(Icons.logout_outlined),
        ),
      ),
      body: Center(
        child: Text('hello, ${user!.email}'),
      ),
    );
  }
}
