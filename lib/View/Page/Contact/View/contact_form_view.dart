// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_new

import 'package:flutter/material.dart';

class ContactFormView extends StatelessWidget {
  const ContactFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
    GlobalKey _formKey = GlobalKey<FormState>();

    final TextEditingController _nameController = new TextEditingController();
    final TextEditingController _emailController = new TextEditingController();
    final TextEditingController _messageController =
        new TextEditingController();

    return Form(
      key: _formKey,
      child: Scaffold(
        key: scaffoldKey,
        body: SizedBox.expand(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  label: Text('Adınız'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    label: Text('E-posta'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  controller: _messageController,
                  textInputAction: TextInputAction.done,
                  maxLines: 10,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      label: Text('Mesaj'),
                      hintText: 'Mesajınız',
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Gönder')),
              )
            ],
          ),
        )),
      ),
    );
  }
}
