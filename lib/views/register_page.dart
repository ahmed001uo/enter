import 'package:cscscsaa/utilities/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.loginPageRoute);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                  const SizedBox(
                    height: 100,
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
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
                      labelText: "password",
                      hintText: "Enter Your password!",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        final UserCredential() = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        Navigator.of(context)
                            .pushNamed(AppRoutes.homePageRoute);
                      } on FirebaseAuthException catch (e) {
                        if (_formkey.currentState!.validate()) {
                          {
                            debugPrint('The password provided is too weak.');
                          }
                        } else if (e.code == 'email-already-in-use') {
                          {
                            debugPrint(
                                'The account already exists for that email.');
                          }
                        }
                      } catch (e) {
                        debugPrint(e as String?);
                      }
                    },
                    child: const Text(
                      "register",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: const Text(
                      "Forget your password!?",
                      style:
                          TextStyle(color: Color.fromARGB(255, 34, 100, 214)),
                    ),
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRoutes.forgetPasswordPageRoute),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
