import 'package:cscscsaa/utilities/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Ecommerce"),
      actions: [IconButton(onPressed: ()async{await FirebaseAuth.instance.signOut();
      Navigator.of( context).pushNamed(AppRoutes.loginPageRoute);
      },
       icon: const Icon(Icons.exit_to_app))],),
      body: const Center(
        child: Column(
          children: [
          
         
          Text("Hi there") 
        ],),
      ),
    );
  }
}
