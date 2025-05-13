import 'package:flutter/material.dart';

import 'ContactsScreen.dart';
import 'ProfleScreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfleScreen()));
              },
              icon: Icon(Icons.person))
        ],
      ),
      body: Text("home"),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        Navigator.push(context,
            MaterialPageRoute(
                builder:
                    (context) => Contactsscreen()));
      },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
    );
  }
}
