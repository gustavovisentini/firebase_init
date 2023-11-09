import 'package:flutter/material.dart';

class Animated2 extends StatefulWidget {
  const Animated2({super.key});

  @override
  State<Animated2> createState() => _Animated2State();
}

class _Animated2State extends State<Animated2> {
  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        color: Colors.black,
        padding: EdgeInsets.all(10),
        height: _status ? 0 : 500,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          elevation: 6,
          child: Text("GO"),
          onPressed: () {
            setState(() {
              _status = !_status;
            });
          }),
    );
  }
}
