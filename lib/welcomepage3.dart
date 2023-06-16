import 'package:flutter/material.dart';
import 'package:object_detection/awalquiz.dart';
import 'home.dart'; // Import halaman home

class WelcomePage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0), // Warna latar belakang
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/book-stack.png',
                    width: 48,
                    height: 48,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Ini yang dapat kamu capai',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6F6F6F),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 45),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/sign-language.png',
                    width: 48,
                    height: 48,
                  ),
                  SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      'Mempraktikkan bahasa isyarat yang kamu kuasai',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF6F6F6F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/blocks.png',
                    width: 48,
                    height: 48,
                  ),
                  SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      'Mengetahui dasar-dasar berbahasa isyarat',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF6F6F6F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Home
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page1()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF1CB0F6),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Mulai Belajar',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
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
    home: WelcomePage3(),
    debugShowCheckedModeBanner: false,
  ));
}
