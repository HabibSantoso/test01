import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test01/layout/home_page.dart';
import 'package:test01/model/contact.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late Box<Contact> box;
  var _formkey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? phone;
  @override
  void initstate() {
    super.initState();
    box = Hive.box('databaseContact');
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Halaman Register')),
        body: Center(
          child: Form(
            key: _formkey,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your Email',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        hintText: 'Enter your Phone',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        phone = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            Contact ct = Contact(
                                name: name!, email: email!, phone: phone!);
                            box.add(ct);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }
                          setState(() {});
                        },
                        child: const Text('Save')),
                  ],
                )),
          ),
        ));
  }
}
