import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detection/bndbox.dart';
import 'package:object_detection/camera.dart';
import 'package:object_detection/quiz1.dart';
import 'dart:math' as math;

class DetectScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String model;

  const DetectScreen({Key? key, required this.cameras, required this.model})
      : super(key: key);

  @override
  State<DetectScreen> createState() => _DetectScreenState();
}

class _DetectScreenState extends State<DetectScreen> {
  List<dynamic>? _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  bool isLetterLDetected = false;
  bool isLetterEDetected = false;
  bool isLetterL2Detected = false;
  bool isLetterE2Detected = false;

  int isLetterLDetectedclear = 0;
  int isLetterEDetectedclear = 0;
  int isLetterL2Detectedclear = 0;
  int isLetterE2Detectedclear = 0;

  bool isLetterLDetectedf = false;
  bool isLetterEDetectedf = false;
  bool isLetterL2Detectedf = false;
  bool isLetterE2Detectedf = false;

  bool isAlertShown = false;

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;

      // Set the detection status for each letter
      isLetterLDetected = _recognitions != null &&
          _recognitions!.any((recognition) =>
              recognition['label'] == 'L' && recognition['confidence'] >= 0.8);
      isLetterEDetected = _recognitions != null &&
          _recognitions!.any((recognition) =>
              recognition['label'] == 'E' && recognition['confidence'] >= 0.8);
      isLetterL2Detected = _recognitions != null &&
          _recognitions!.any((recognition) =>
              recognition['label'] == 'L' && recognition['confidence'] >= 0.8);
      isLetterE2Detected = _recognitions != null &&
          _recognitions!.any((recognition) =>
              recognition['label'] == 'E' && recognition['confidence'] >= 0.8);

      if (isLetterLDetected) {
        isLetterLDetectedclear += 1;
        if (isLetterLDetectedclear > 0) {
          isLetterLDetectedf = true;
        }
      }

      if (isLetterEDetected) {
        isLetterEDetectedclear += 1;
        if (isLetterEDetectedclear > 0 && isLetterLDetectedf == true) {
          isLetterEDetectedf = true;
        }
      }

      if (isLetterL2Detected) {
        isLetterL2Detectedclear += 1;
        if (isLetterL2Detectedclear > 0 && isLetterEDetectedf == true) {
          isLetterL2Detectedf = true;
        }
      }

      if (isLetterE2Detected) {
        isLetterE2Detectedclear += 1;
        if (isLetterE2Detectedclear > 0 && isLetterL2Detectedf == true) {
          isLetterE2Detectedf = true;
        }
      }

      // Check if all letters are detected and turn them white
      if (isLetterLDetectedf &&
          isLetterEDetectedf &&
          isLetterL2Detectedf &&
          isLetterE2Detectedf &&
          !isAlertShown) {
        isAlertShown = true;
        showFinishedAlert();
      }
    });
  }

  void showFinishedAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Selesai'),
          content: Text('Finished!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => QuizAScreen()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    double cameraAspectRatio = _imageHeight > 0 && _imageWidth > 0
        ? _imageWidth / _imageHeight
        : screen.width / screen.height;
    double scaledWidth = screen.width;
    double scaledHeight = screen.width / cameraAspectRatio;

    if (scaledHeight > screen.height) {
      scaledHeight = screen.height;
      scaledWidth = screen.height * cameraAspectRatio;
    }

    return Scaffold(
      backgroundColor: Color(0xFFFAA918), // Warna FAA918 (kuning)
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: screen.width,
                  height: screen.height,
                  child: AspectRatio(
                    aspectRatio: cameraAspectRatio,
                    child: Camera(
                      [widget.cameras[1]],
                      widget.model,
                      setRecognitions,
                    ),
                  ),
                ),
                Positioned(
                  top: (screen.height - scaledHeight) / 4,
                  left: (screen.width - scaledWidth) / 2,
                  child: BndBox(
                    _recognitions ?? [],
                    math.max(_imageHeight, _imageWidth),
                    math.min(_imageHeight, _imageWidth),
                    screen.height,
                    screen.width,
                    widget.model,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Peragakan alfabet dari kata ini',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'L',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isLetterLDetectedf ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'E',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isLetterEDetectedf ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'L',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isLetterL2Detectedf ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'E',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isLetterE2Detectedf ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Image.asset(
                'assets/images/catfish.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      home: DetectScreen(cameras: [firstCamera], model: 'model'),
    ),
  );
}
