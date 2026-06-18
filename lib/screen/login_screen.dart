import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:self_learn8/notifier/auth_notifier.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Authentications Login")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            SizedBox(height: 20),
            TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            // checked
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: authState.isloading
                  ? null
                  : () {
                      ref
                          .read(authProvider.notifier)
                          .login(emailcontroller.text, passwordcontroller.text);
                    },
              child: authState.isloading
                  ? const CircularProgressIndicator()
                  : const Text("Login"),
            ),

            // checked error message
            if (authState.error != null)
              Text(
                authState.error!,
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),

            // checked loggin
            if (authState.islogged) const Text("Login succesfully...!✅"),
          ],
        ),
      ),
    );
  }
}
