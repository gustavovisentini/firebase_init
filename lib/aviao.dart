import 'package:flutter/material.dart';

class Aviao extends StatefulWidget {
  const Aviao({super.key});

  @override
  State<Aviao> createState() => _AviaoState();
}

class _AviaoState extends State<Aviao> {
  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        color: Colors.green,
        padding: EdgeInsets.only(bottom: 150, top: 20),
        alignment: _status ? Alignment.bottomCenter : Alignment.topCenter,
        child: AnimatedOpacity(
          opacity: _status ? 1 : 0,
          duration: Duration(seconds: 1),
          child: Container(
            height: 50,
            child: Icon(
              Icons.airplanemode_active,
              size: 150,
              color: Colors.white,
            ),
          ),
        ),
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
