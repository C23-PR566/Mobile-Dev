import 'package:flutter/material.dart';
import 'package:object_detection/finishquiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz A',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF282890, {
          50: Color(0xFFE6E6FF),
          100: Color(0xFFB3B3FF),
          200: Color(0xFF8080FF),
          300: Color(0xFF4D4DFF),
          400: Color(0xFF1A1AFF),
          500: Color(0xFF0000FF),
          600: Color(0xFF0000CC),
          700: Color(0xFF000099),
          800: Color(0xFF000066),
          900: Color(0xFF000033),
        }),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QuizAScreen(),
    );
  }
}

class QuizAScreen extends StatefulWidget {
  @override
  _QuizAScreenState createState() => _QuizAScreenState();
}

class _QuizAScreenState extends State<QuizAScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController _answerController = TextEditingController();
  bool _isCorrect = false;
  late AnimationController _animationController;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );
  }

  void _checkAnswer() {
    String answer = _answerController.text.trim().toUpperCase();
    setState(() {
      _isCorrect = answer == 'AYAM';
      if (!_isCorrect) {
        _animationController.reset();
        _animationController.forward();
      } else {
        _isCompleted = true;
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _isCorrect = false;
      _isCompleted = false;
      _answerController.text = '';
    });
  }

  @override
  void dispose() {
    _answerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color(0xFFFAA918), // Set AppBar background color
      ),
      body: Container(
        color: Color(0xFFFFC715), // Set background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Kata apa yang terbentuk dari bahasa isyarat ini?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(
                'assets/images/ayam.png',
                height: 150,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _answerController,
                style: TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  hintText: 'Masukkan jawaban Anda',
                  filled: true,
                  fillColor: Color(0xFFCFCFCF), // Set TextField background color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(194, 97, 232, 25)),
              ),
              child: Text('SUBMIT'),
            ),
            SizedBox(height: 20),
            if (_isCorrect && _isCompleted)
              Column(
                children: [
                  Text(
                    'BENAR!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'SELESAI',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizCompletionPage(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(194, 97, 232, 25)),
                    ),
                    child: Text('OK'),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
