import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

import 'package:object_detection/models.dart';
import 'dart:io';

import 'detect_screen.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  File? _selectedImage;

  late final List<CameraDescription> cameras;
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await setupCameras();
  }

  loadModel(model) async {
    String? res;
    switch (model) {
      case yolo:
        res = await Tflite.loadModel(
          model: "assets/yolov2_tiny.tflite",
          labels: "assets/yolov2_tiny.txt",
        );
        break;

      case mobilenet:
        res = await Tflite.loadModel(
            model: "assets/mobilenet_v1_1.0_224.tflite",
            labels: "assets/mobilenet_v1_1.0_224.txt");
        break;

      case posenet:
        res = await Tflite.loadModel(
            model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
        break;

      default:
        res = await Tflite.loadModel(
            model: "assets/ssd_mobilenet.tflite",
            labels: "assets/ssd_mobilenet.txt");
    }
    log("$res");
  }

  onSelect(model) {
    loadModel(model);
    final route = MaterialPageRoute(builder: (context) {
      return DetectScreen(cameras: cameras, model: model);
    });
    Navigator.of(context).push(route);
  }

  setupCameras() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      log('Error: $e.code\nError Message: $e.message');
    }
  }

  void _onMyButtonPressed() {
    // Aksi yang dijalankan saat tombol "My Button" ditekan
    print("Tombol 'My Button' ditekan!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xC26F6F6F), // Set background color
        centerTitle: true, // Set text alignment to center
        title: Text(
          'isyarat',
          style: TextStyle(color: Colors.white), // Set text color
        ),
      ),
      body: Container(
        color: Color(0xFF4C4C4C), // Set background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _selectedImage != null
                  ? Image.file(
                      _selectedImage!,
                      height: 200,
                    )
                  : Container(),
              SizedBox(height: 16),
              Text(
                'Peragakan kata LELE',
                style: TextStyle(fontSize: 18, color: Colors.white), // Set text color
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => onSelect(mobilenet),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(194, 97, 232, 25), // Set button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Set border radius
                  ),
                ),
                child: Text('Buka Kamera'),
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
    home: QuizPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(194, 97, 232, 25), // Set background color
      ),
    ),
  ));
}
