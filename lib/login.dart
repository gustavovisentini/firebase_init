import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_init/create_account.dart';
import 'package:firebase_init/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  _validaCampos() {
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;

    if (email.isNotEmpty && email.contains("@")) {
      if (password.isNotEmpty && password.length >= 6) {
        FirebaseAuth auth = FirebaseAuth.instance;
        auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) => {
                  //sucesso
                  //navegando para a home e removendo esta pagina para nao poder voltar
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false)
                });
      }
    }
  }

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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccount()));
                    },
                    child: Text("Create Account")),
              )
            ]),
      ),
    );
  }
}
