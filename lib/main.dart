import 'package:flutter/material.dart';
import 'dart:async';
import 'dashboard_page.dart'; // Kita akan buat file ini selanjutnya

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Pemrograman Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), // Memulai dengan Splash Screen
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer 5 detik 
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => DashboardPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ganti dengan logo atau gambar yang sesuai
            FlutterLogo(size: 100),
            const SizedBox(height: 24),
            Text(
              "Judul Aplikasi Anda", // 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Ganti dengan foto Anda 
            CircleAvatar(
              radius: 50,
              // Ganti dengan gambar Anda di folder assets
              backgroundImage: AssetImage('assets/images/profil.jpg'), 
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(height: 16),
            Text(
              "Yasrifal Fawaz", // 
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "152023024", // 
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}