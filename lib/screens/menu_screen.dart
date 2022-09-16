import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'log_in_screen.dart';
class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          ElevatedButton(
              onPressed: (){
                SignOut();
              },
              child: Text("Log Out"))
        ],

      ),
    );
  }
  Future <void> SignOut()async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogInPage()));
  }
}
