import 'package:flutter/material.dart';
import 'package:latres_prakmobile_124220140/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> registerSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username.text);
    await prefs.setString('password', password.text);
  }

  void registerAkun() {
    registerSharedPreferences();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Akun Berhasil Tersimpan!'),
      backgroundColor: Colors.green,
    ));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
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
                    'Register',
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
                          onPressed: registerAkun,
                          child: const Text('Register'))),
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
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text('Login'))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
