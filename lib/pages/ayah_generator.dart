import 'dart:math';
import 'package:new_app/pages/final_aya.dart';
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
                  margin: const EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(
                      '{إِنَّا نَحْنُ نَزَّلْنَا الذِّكْرَ وَإِنَّا لَهُ لَحافِظُونَ}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20, // Adjusted from 50 to fit smaller screens
                        fontFamily: 'Lateef',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  'أدخل رقما من 1 إلى 50',
                  style: const TextStyle(
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
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
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
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shadowColor: Colors.white,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              a--; // Assuming `a--` is intentional
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => FinalAya()),
                              );
                            }
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
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
