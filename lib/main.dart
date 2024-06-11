import 'package:flutter/material.dart';
import 'package:hemat_yuk/pages/halaman_awal.dart';
import 'package:hemat_yuk/pages/halaman_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hemat_yuk/firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hemat_yuk/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF235789)),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme()),
      home: SplashScreen(),
    );
  }
}
