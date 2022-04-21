import 'dart:math';

import 'package:ayah_app/pages/final_aya.dart';
import 'package:flutter/material.dart';

class AyahGenerator extends StatefulWidget {
  const AyahGenerator({Key? key}) : super(key: key);

  @override
  State<AyahGenerator> createState() => _AyahGeneratorState();
}

final _formKey = GlobalKey<FormState>();
late int a;

class _AyahGeneratorState extends State<AyahGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(
                      '{إِنَّا نَحْنُ نَزَّلْنَا الذِّكْرَ وَإِنَّا لَهُ لَحافِظُونَ}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontFamily: 'Lateef',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Text(
                  'أدخل رقما من 1 إلى 50',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Lateef',
                  ),
                  textAlign: TextAlign.center,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'المرجو إدخال رقم من 1 إلى 50';
                          }
                          try {
                            a = int.parse(value);
                          } catch (e) {
                            return 'المرجو إدخال رقم من 1 إلى 50';
                          }

                          if (a < 1 || a > 50) {
                            return 'المرجو إدخال رقم من 1 إلى 50';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            shadowColor: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                a--;
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FinalAya()),
                                );
                              }
                            });
                          },
                          child: const Text(
                            'بحث',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shadowColor: Colors.white,
                  ),
                  onPressed: () {
                    a = Random().nextInt(50);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => FinalAya()),
                    );
                  },
                  child: const Text(
                    'بحث عشوائي',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
