import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hemat_yuk/pages/halaman_signup.dart';
import 'package:hemat_yuk/pages/home_page.dart';

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisiblePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF5AB2FF), // Warna dari tengah ke atas
                  Color(0xFF5AB2FF), // Warna tengah
                  Color(0xFF1B98E5), // Warna dari tengah ke bawah
                ],
                stops: [0.0, 0.5, 1.0], // Mengatur titik transisi warna
              ),
            ),
          ),
          SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    "assets/logo2.jpeg",
                    fit:
                        BoxFit.cover, // Adjust how the image fits the container
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(90))),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person, color: Colors.white),
                          labelText: 'Email',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(90))),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: isVisiblePassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisiblePassword = !isVisiblePassword;
                                });
                              },
                              icon: Icon(isVisiblePassword
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded)),
                          labelText: 'Password',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                              (route) => false);
                        },
                        child: Text('Sign In')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Belum punya Akun?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HalamanSignUp()),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
