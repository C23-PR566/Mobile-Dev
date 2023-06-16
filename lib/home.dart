  import 'package:flutter/material.dart';
  import 'package:object_detection/pre_quiz.dart';
  import 'package:object_detection/profilepage.dart';
  import 'package:object_detection/login.dart';
  import 'package:object_detection/welcomepage3.dart';
  import 'package:object_detection/welcomepage1.dart';
  import 'package:object_detection/awalquiz.dart'; // Import halaman AwalQuiz

  class MainPage extends StatefulWidget {
    final bool isFromWelcomePage3;

    MainPage({this.isFromWelcomePage3 = false});

    @override
    _MainPageState createState() => _MainPageState();
  }

  class _MainPageState extends State<MainPage> {
    void tampilkanDialogPengembangan() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Dalam Pengembangan'),
            content: Text('Fitur ini masih dalam tahap pengembangan.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    @override
    Widget build(BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Tahap',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Color(0xFF4C4C4C),
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PreQuiz()),
                            );
                          } else {
                            tampilkanDialogPengembangan();
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: index == 0 ? Color.fromARGB(194, 97, 232, 25) : Colors.grey,
                          radius: 30,
                          child: index == 0
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      Text(
                                        '1',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                  ],
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 26,
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Mengarahkan ke halaman sebelumnya
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(194, 97, 232, 25),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    padding: EdgeInsets.all(16),
                  ),
                  child: Text(
                    'KEMBALI',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Color(0xFF6F6F6F),
          bottomNavigationBar: BottomAppBar(
            color: Color(0xFF4C4C4C),
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/images/house.png',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Page1()),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/images/man.png',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    if (widget.isFromWelcomePage3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    }
                  },
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
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    ));
  }
