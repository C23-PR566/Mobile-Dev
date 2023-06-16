import 'package:flutter/material.dart';
import 'package:object_detection/home.dart';

class QuizCompletionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF8549BA), // Set background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/accept1.png',
                height: 70,
              ),
              SizedBox(height: 16),
              Text(
                'Selamat, kamu telah menyelesaikan quiz dengan baik!',
                style: TextStyle(fontSize: 18, color: Colors.white), // Set text color to white
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFA560E8)), // Set button color to A560E8
                ),
                child: Text(
                  'HOME',
                  style: TextStyle(color: Colors.white), // Set button text color to white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: QuizCompletionPage(),
    debugShowCheckedModeBanner: false,
  ));
}
