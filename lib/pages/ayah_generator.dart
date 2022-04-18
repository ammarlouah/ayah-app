import 'package:flutter/material.dart';

class AyahGenerator extends StatefulWidget {
  const AyahGenerator({Key? key}) : super(key: key);

  @override
  State<AyahGenerator> createState() => _AyahGeneratorState();
}

final _formKey = GlobalKey<FormState>();

class _AyahGeneratorState extends State<AyahGenerator> {
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
                    keyboardType: TextInputType.number,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      int a;
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text(
                        'بحث',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
