import 'package:flutter/material.dart';
import 'package:ayah_app/ayat.dart';
import 'ayah_generator.dart';
import 'package:clipboard/clipboard.dart';

String aya = ayat(a);

class FinalAya extends StatefulWidget {
  const FinalAya({Key? key}) : super(key: key);

  @override
  State<FinalAya> createState() => _FinalAyaState();
}

class _FinalAyaState extends State<FinalAya> {
  @override
  Widget build(BuildContext context) {
    aya = ayat(a);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'الآية',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Lateef',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60),
              Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text(
                    aya,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontFamily: 'Lateef',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              FlatButton(
                color: Colors.white,
                child: Text(
                  'نسخ الآية',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    FlutterClipboard.copy(aya);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'تم نسخ الآية إ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        /*action: SnackBarAction(
                        label: 'Action',
                        onPressed: () {},
                      ),*/
                      ),
                    );
                  });
                },
              ),
              SizedBox(height: 20),
              FlatButton(
                color: Colors.white,
                child: Text(
                  'ابحث عن آية أخرى',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AyahGenerator()),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
