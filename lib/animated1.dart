import 'package:flutter/material.dart';

class Animated1 extends StatefulWidget {
  const Animated1({super.key});

  @override
  State<Animated1> createState() => _Animated1State();
}

class _Animated1State extends State<Animated1> {
  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My app"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _status = !_status;
            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.linear,
            alignment: Alignment.center,
            width: _status ? 60 : 300,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(children: [
              Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: _status ? 1 : 0,
                  child: const Icon(Icons.add),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: _status ? 0 : 1,
                  child: const Text("Usuario adicionado com sucesso!"),
                ),
              )
            ]),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          elevation: 6,
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _status = !_status;
            });
          }),
    );
  }
}
