import 'package:flutter/material.dart';
import 'welcomepage3.dart'; // Import halaman welcomepage3

class WelcomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0), // Warna latar belakang
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/hand.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 8),
            Text(
              'Halo!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6F6F6F),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Selamat datang di isyarat',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6F6F6F),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Disini kita akan belajar bahasa isyarat bersama',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6F6F6F),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50), // Batas atas tombol "Lanjutkan"
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman WelcomePage3
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomePage3()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF1CB0F6),
                  onPrimary: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Lanjutkan',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WelcomePage2(),
    debugShowCheckedModeBanner: false,
  ));
}