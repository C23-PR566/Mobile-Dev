import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100), // Jarak antara bagian atas dan judul
          Text(
            'Judul',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50), // Jarak antara judul dan gambar
          Image.asset(
            'assets/images/assets.jpg', // Path gambar assets
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 50), // Jarak antara gambar dan tombol
          ElevatedButton(
            onPressed: () {
              // Aksi yang ingin ditambahkan saat tombol "Mulai" ditekan
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              primary: Colors.blue,
            ),
            child: Text(
              'Mulai',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
