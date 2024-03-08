import 'package:cscscsaa/utilities/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce"),
        actions: [
          IconButton(
              onPressed: () async {
                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.disconnect();
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamed(AppRoutes.loginPageRoute);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                "https://images.pexels.com/photos/1884579/pexels-photo-1884579.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                width: double.infinity,
                height: size.height * 0.26,
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50.1),
                child: Text(
                  "Classic Clothes",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Color.fromARGB(255, 87, 23, 128),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
