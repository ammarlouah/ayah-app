import 'package:flutter/material.dart';

import 'ayah_generator.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.all(10.0),
              child: ListTile(
                title: Text(
                  'لدي 50 آية قرآنية \n في الصفحة التالية أدخل رقما من 1 إلى 50 و ستظهر لك آية اعتبرها رسالة من الله لك',
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
            FlatButton(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AyahGenerator()),
                  );
                });
              },
              color: Colors.white,
              child: Text(
                'إبدأ',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
