// ignore_for_file: deprecated_member_use, avoid_print

import 'package:chat_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const _Logo(),
                _Form(),
                _Labels(),
                const Text(
                  'Términos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Correo electronico',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            textController: passCtrl,
            isPassword: true,
          ),
          //TextField(),
          RaisedButton(
            elevation: 2, //sombra
            highlightElevation: 5, //la sombra que proyecta
            color: Colors.blue,
            shape: const StadiumBorder(),
            onPressed: () {
              print(emailCtrl.text);
              print(passCtrl.text);
            },
            // ignore: prefer_const_constructors
            child: SizedBox(
              width: double.infinity, // w full
              height: 55,
              child: const Center(
                child: Text('Ingrese',
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 170,
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        children: const <Widget>[
          Image(image: AssetImage('assets/tag-logo.png')),
          SizedBox(height: 20),
          Text(
            'Messenger',
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    ));
  }
}

class _Labels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          "No tienes cuenta",
          style: TextStyle(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          child: Text(
            "Crea una ahora",
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, 'register');
          },
        ),
      ],
    );
  }
}
