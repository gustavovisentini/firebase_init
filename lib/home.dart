import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_init/login.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //instancia para o banco
  FirebaseFirestore db = FirebaseFirestore.instance;
  String nome = "", idade = "";
  //instancia para autenticacao
  FirebaseAuth auth = FirebaseAuth.instance;

  // enviar dados ao banco
  void setDados() async {
    db
        .collection("usuarios")
        .doc("2")
        .set({"nome": "Andre", "idade": "17", "cpf": "1234567890"});
  }

  // buscar dados no banco
  void getDados() async {
    DocumentSnapshot snapshot = await db.collection("usuarios").doc("1").get();

    Map<String, dynamic>? dados = snapshot.data() as Map<String, dynamic>?;

    if (dados != null) {
      setState(() {
        nome = dados["nome"];
        idade = dados["idade"];
      });
    }
    print(nome + idade);
  }

  // criar conta de usuario
  void criarConta() async {
    String email = "gustavovisentini@uricer.edu.br";
    String password = "123456";

    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((firebaseUser) => {
              //posso mandar pra putra pagina
              print("usuario criado"),
              print(firebaseUser.user?.email)
            })
        .onError((error, stackTrace) => {print(error.toString())});
  }

  //testar se esta logado
  void verificaLogin() async {
    User? user = await auth.currentUser;
    if (user != null) {
      print(user.email);
      print("usuario logado");
    } else {
      print("Não está logado");
    }
  }

  //deslogar
  void deslogar() async {
    await auth.signOut().then((value) => {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
              (route) => false)
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //criarConta();
    //verificaLogin();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //deslogar();
      //verificaLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                deslogar();
              },
              child: Text("LogOut"))
        ],
      )),
    );
  }
}
