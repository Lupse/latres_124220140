import 'package:flutter/material.dart';
import 'package:latres_prakmobile_124220140/auth/register.dart';
import 'package:latres_prakmobile_124220140/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String? usernameFromSession;
  String? passwordFromSession;

  @override
  void initState() {
    super.initState();
    loadSession();
  }

  Future<void> loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      usernameFromSession = prefs.getString('username');
      passwordFromSession = prefs.getString('password');
    });
  }

  void login() {
    if (username.text == usernameFromSession &&
        password.text == passwordFromSession) {
      // Login Berhasil
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login Berhasil!'),
        backgroundColor: Colors.green,
      ));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      // Login Berhasil
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login Gagal!'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          width: 325,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                color: Colors.black12),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: username,
                    decoration: const InputDecoration(
                        label: Text('Username'), border: OutlineInputBorder()),
                  ),
                  TextField(
                    controller: password,
                    decoration: const InputDecoration(
                        label: Text('Password'), border: OutlineInputBorder()),
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.black),
                              foregroundColor:
                                  WidgetStatePropertyAll(Colors.white)),
                          onPressed: login,
                          child: const Text('Login'))),
                  SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.white),
                              foregroundColor:
                                  WidgetStatePropertyAll(Colors.black)),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()));
                          },
                          child: const Text('Register'))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
