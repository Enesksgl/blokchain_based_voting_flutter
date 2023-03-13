import 'package:blokchain_based_voiting/main.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 150,
            color: Theme.of(context).primaryColor,
            child: const Center(child: Text("Sign In", style: TextStyle(fontSize: 50, color: Colors.white))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.person), hintText: "TC Kimlik", labelText: "TC Kimlik", border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.lock), hintText: "Password", labelText: "Password", border: OutlineInputBorder()),
                ),
                saveButton("GİRİŞ"),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Şifreni mi unuttun ?",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget saveButton(String buttontext) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        child: FilledButton(
          onPressed: () => globalNavigator.currentState!.pushReplacementNamed("/voteFeed"),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(width: 40),
              Text(buttontext, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
              const SizedBox(width: 40),
            ],
          ),
        ),
      ),
    );
  }
}
