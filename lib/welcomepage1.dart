import 'package:flutter/material.dart';
import 'login.dart'; // Import halaman login
import 'welcomepage2.dart';

class WelcomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0), // Warna latar belakang
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Cara gratis, seru, dan efektif untuk belajar bahasa isyarat',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6F6F6F),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 70), // Tambahkan jarak antara teks dan tombol
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  // Navigasi ke halaman WelcomePage2
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomePage2()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF1CB0F6),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: Text('Ayo Mulai'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  // Navigasi ke halaman login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFCFCFCF),
                  primary: Color(0xFF1CB0F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: Text('Aku Sudah Punya Akun'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WelcomePage1(),
    debugShowCheckedModeBanner: false,
  ));
}
