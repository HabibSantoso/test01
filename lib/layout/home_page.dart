import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test01/layout/update_page.dart';
import 'package:test01/model/contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> ct = [];
  late Box<Contact> box;
  @override
  void initState() {
    super.initState();
    box = Hive.box('databaseContact');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              itemCount: ct.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onLongPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UpdatePage(
                          
                        )));
                  },
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(ct[index].name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ct[index].email),
                          Text(ct[index].phone)
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
