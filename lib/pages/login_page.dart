// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notes/components/my_submitbutton.dart';
import 'package:notes/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void loginBtn(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: const CircularProgressIndicator(),
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );
      if (context.mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      String error = '';
      if (e.code == 'user-not-found') {
        error = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        error = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        error = 'The email provided is invalid';
      } else {
        error = 'Some error occured!';
      }

      // print(e.code);

      if (context.mounted) {
        Navigator.pop(context);
        showError(error, context);
      }
    }
  }

  void showError(String error, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7F6F2),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Icon(
              Icons.lock,
              size: 72,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text("Welcome Back, you've been missed!"),
            const SizedBox(
              height: 25,
            ),
            MyTextfield(
              hintText: "Username",
              controller: usernameController,
              obsecureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextfield(
              hintText: "Password",
              controller: passwordController,
              obsecureText: true,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 25, top: 10),
                  child: Text("Forgot password?"),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            MySubmitButton(
              text: "Login",
              onTap: () => loginBtn(context),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Or Continue with"),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              height: 64,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 247, 245, 245),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Image.asset('assets/google.png'),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Not a member?"),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Sign Up now!",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
