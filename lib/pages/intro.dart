import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('One Ayah'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'لدي 50 آية قرآنية , في الصفحة التالية أدخل رقما من 1 إلى 50 و ستظهر لك آية اعتبرها رسالة من الله لك.',
              style: TextStyle(
                fontSize: 50,
              ),
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.black,
              child: Text('إبدأ'),
              textColor: Colors.white,
              
            )
          ],
        ),
      ),
    );
  }
}
