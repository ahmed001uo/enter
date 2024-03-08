import 'package:cscscsaa/utilities/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushNamed(AppRoutes.homePageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  textInputAction: TextInputAction.next,
                  validator: (val) =>
                      val!.isEmpty ? "please Enter your Email!" : null,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter Your Email!",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  textInputAction: TextInputAction.next,
                  validator: (val) =>
                      val!.isEmpty ? "please Enter your Password!" : null,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Enter Your Password!",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        final UserCredential() = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text);
                        Navigator.of(context)
                            .pushNamed(AppRoutes.homePageRoute);
                      } on FirebaseAuthException catch (e) {
                        if (_formkey.currentState!.validate()) {
                          {
                            debugPrint('No user found for that email.');
                          }
                        } else if (e.code == 'wrong-password') {
                          {
                            debugPrint(
                                'Wrong password provided for that user.');
                          }
                        }
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 24),
                    )),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamed(AppRoutes.registerPageRoute),
                    child: const Text(
                      "register",
                      style: TextStyle(fontSize: 24),
                    )),
                InkWell(
                  child: const Text(
                    "Forget your password!?",
                    style: TextStyle(color: Color.fromARGB(255, 34, 100, 214)),
                  ),
                  onTap: () => Navigator.of(context)
                      .pushNamed(AppRoutes.forgetPasswordPageRoute),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      signInWithGoogle();
                    },
                    child: const Text(
                      "Login With Google",
                      style: TextStyle(fontSize: 24, color: Colors.blueAccent),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
