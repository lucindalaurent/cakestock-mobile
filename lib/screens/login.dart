import 'package:cakestock/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(48.0),
        decoration: const BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _usernameController,
                obscureText: false,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person)),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
                width: 300,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    // Untuk menyambungkan Android emulator dengan Django pada localhost,
                    // gunakan URL http://10.0.2.2/
                    final response = await request.login(
                        "https://lucinda-laurent-tugas.pbp.cs.ui.ac.id/auth/login/",
                        {
                          'username': username,
                          'password': password,
                        });

                    if (request.loggedIn) {
                      String message = response['message'];
                      String uname = response['username'];
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                            content: Text("$message Selamat datang, $uname.")));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Login Gagal'),
                          content: Text(response['message']),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
