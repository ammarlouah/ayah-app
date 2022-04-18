import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'لدي 50 آية قرآنية , في الصفحة التالية أدخل رقما من 1 إلى 50 و ستظهر لك آية اعتبرها رسالة من الله لك',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60),
            RaisedButton(
              onPressed: () {},
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
