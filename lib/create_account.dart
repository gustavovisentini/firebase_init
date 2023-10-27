import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_init/home.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerCPF = TextEditingController();

  bool state = false;

  String _msgErro = "";

  _createAccount() {
    String _email = _controllerEmail.text;
    String _password = _controllerPassword.text;
    String _nome = _controllerNome.text;
    String _cpf = _controllerCPF.text;

    if (_email.isNotEmpty && _email.contains("@")) {
      if (_password.isNotEmpty && _password.length >= 6) {
        if (_cpf.length >= 11) {
          if (_nome.isNotEmpty) {
            //instancia do auth
            FirebaseAuth auth = FirebaseAuth.instance;
            //instancia do bd
            FirebaseFirestore db = FirebaseFirestore.instance;

            //gravar no banco
            Map<String, dynamic> dadosUser = {
              'nome': _nome,
              'email': _email,
              'cpf': _cpf
            };

            auth
                .createUserWithEmailAndPassword(
                    email: _email, password: _password)
                .then((firebaseUser) => {
                      //gravar no banco usando o UID
                      db
                          .collection('usuarios')
                          .doc(firebaseUser.user!.uid)
                          .set(dadosUser),
                      _msgErro = "Sucesso ao logar",
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (route) => false)
                    })
                .onError((error, stackTrace) => {_msgErro = error.toString()});
          } else {
            setState(() {
              _msgErro = "Dados Invalidos";
            });
          }
        } else {
          setState(() {
            _msgErro = "Dados Invalidos";
          });
        }
      } else {
        setState(() {
          _msgErro = "Dados Invalidos";
        });
      }
    } else {
      setState(() {
        _msgErro = "Dados Invalidos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Create Account")),
        body: Center(
            child: Column(
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
            //nome do vivente
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controllerNome,
                //keyboardType: TextInput,
                autofocus: false,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(hintText: "Nome completo"),
              ),
            ),
            //CPF
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controllerCPF,
                keyboardType: TextInputType.number,
                autofocus: false,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(hintText: "CPF"),
              ),
            ),
            //botao criar conta
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {}, child: Text("Create Account")),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(_msgErro),
            )
          ],
        )));
  }
}
