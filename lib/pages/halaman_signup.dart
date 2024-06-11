// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hemat_yuk/pages/halaman_login.dart';

class HalamanSignUp extends StatefulWidget {
  const HalamanSignUp({super.key});

  @override
  State<HalamanSignUp> createState() => _HalamanSignUpState();
}

class _HalamanSignUpState extends State<HalamanSignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isVisiblePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
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
        SafeArea(
          child: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Sign Up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Column(
                  children: [
                    // Container(
                    //   padding: EdgeInsets.all(5),
                    //   height: 50,
                    //   width: 300,
                    //   decoration: BoxDecoration(
                    //       color: Colors.white.withOpacity(0.5),
                    //       borderRadius: BorderRadius.all(Radius.circular(90))),
                    //   child: TextField(
                    //     controller: _usernameController,
                    //     decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       prefixIcon: Icon(Icons.person, color: Colors.white),
                    //       labelText: 'Username',
                    //       floatingLabelBehavior: FloatingLabelBehavior.never,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(90))),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person, color: Colors.white),
                          labelText: 'Email',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(90))),
                      child: TextField(
                        controller: _passwordController,
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
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                          // ignore: use_build_context_synchronously
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.bottomSlide,
                            title: 'Data disimpan',
                            desc: 'Kembali ke halaman login?',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HalamanLogin(),
                                  ),
                                  (route) => false);
                            },
                          ).show();
                        },
                        child: const Text('Sign Up')),
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
