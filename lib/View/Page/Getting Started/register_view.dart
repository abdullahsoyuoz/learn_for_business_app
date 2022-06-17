import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  final VoidCallback callback;
  const RegisterView({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Kullanıcı Adı'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('E-Posta'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('Doğum Tarihi'),
                  hintText: ''
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('Parola'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('Parola (Tekrar)'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  callback.call();
                },
                child: const Text('Kayıt Olun'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
