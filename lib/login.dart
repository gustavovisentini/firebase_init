import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  _validaCampos() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Init"),
      ),
      body: Container(
        child: Column(
            //alinhamentos dos widgets filhos
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //text input do email
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(hintText: "Email"),
                ),
              ),
              //text input do password
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _controllerPassword,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(hintText: "Password"),
                ),
              ),
              //botao login
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {
                      _validaCampos();
                    },
                    child: Text("Login")),
              ),
              //botao criar conta
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {
                      //navigator para a tela de criar conta
                    },
                    child: Text("Create Account")),
              )
            ]),
      ),
    );
  }
}
