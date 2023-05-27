import 'package:blokchain_based_voiting/common/api.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String tc = "", password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 150,
            color: Theme.of(context).primaryColor,
            child: const Center(child: Text("Giriş Yap", style: TextStyle(fontSize: 50, color: Colors.white))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.person), hintText: "TC Kimlik", labelText: "TC Kimlik", border: OutlineInputBorder()),
                  onChanged: (value) => tc = value,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.lock), hintText: "Şifre", labelText: "Şifre", border: OutlineInputBorder()),
                  onChanged: (value) => password = value,
                ),
                saveButton(),
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

  Widget saveButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: FilledButton(
          onPressed: () {
            ApiService().login(tc, password).then((value) {
              if (value) {
                print(value);
                globalNavigator.currentState!.pushReplacementNamed("/voteFeed");
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Kullanıcı adı veya şifre hatalı")));
              }
              setState(() {});
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(width: 40),
              (ApiService.jwt == "" || ApiService.jwt == "unauthorized")
                  ? const Text("GİRİŞ YAP", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24))
                  : const CircularProgressIndicator(color: Colors.white),
              const SizedBox(width: 40),
            ],
          ),
        ),
      ),
    );
  }
}
