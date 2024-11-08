import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:new_app/ayat.dart';
import 'ayah_generator.dart';
import 'package:clipboard/clipboard.dart';
import 'package:new_app/app_brain.dart';

AppBrain appbrain = AppBrain();

class FinalAya extends StatefulWidget {
  const FinalAya({Key? key}) : super(key: key);

  @override
  State<FinalAya> createState() => _FinalAyaState();
}

class _FinalAyaState extends State<FinalAya> {
  @override
  Widget build(BuildContext context) {
    String aya = appbrain.getAya(a);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'الآية : ${a + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Lateef',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                Card(
                  margin: const EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(
                      '${aya}\n${appbrain.getSrc(a)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20, // Adjusted from 50 for better layout
                        fontFamily: 'Lateef',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  onPressed: () {
                    FlutterClipboard.copy(aya);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'تم نسخ الآية',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'نسخ الآية',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AyahGenerator()),
                    );
                  },
                  child: const Text(
                    'ابحث عن آية أخرى',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(
                        'التفسير المختصر',
                        textAlign: TextAlign.center,
                      ),
                      content: SingleChildScrollView(
                        child: Text(
                          appbrain.getTafsir(a),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('رجوع'),
                        ),
                      ],
                    ),
                  ),
                  child: const Text(
                    'تفسير الآية',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
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
