import 'package:flutter/material.dart';
class language extends StatefulWidget {
  @override
  _languageState createState() => _languageState();
}

class _languageState extends State<language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Language',
        style:TextStyle(color: Colors.white, fontSize: 12 )),
      ),
      body: Center(
        child:Column(
          children: <Widget>[
            Text("hello")
          ],
        )
      ),
    );
  }
}