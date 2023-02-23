import 'package:flutter/material.dart';

class SchoolClassScreen extends StatefulWidget {
  const SchoolClassScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SchoolClassScreen();

}

class _SchoolClassScreen extends State<SchoolClassScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Class'),
        ),
      ),
    );
  }
}