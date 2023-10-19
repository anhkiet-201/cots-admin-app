import 'package:cots_web_admin/app.dart';
import 'package:cots_web_admin/pages/login/LoginProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'PET SHOP ADMIN DASHBOARD',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Login to dashboard.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 500,
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    hintText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 500,
              child: TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.password_rounded)),
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _loginButton()
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    final provider = context.watch<LoginProvider>();
    return ElevatedButton(
        onPressed: () {
          provider.login(email: _emailController.text, password: _passwordController.text);
        },
        child: SizedBox(
          height: 50,
          width: 100,
          child: Center(
            child: provider.isLoading ? const CircularProgressIndicator() : const Text('Enter'),
          )
        )
    );
  }
}
