import 'package:cscscsaa/utilities/routes.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Forget your passord",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purple),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Write your email !!",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple),
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
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.homePageRoute),
              child: const Text(
                "send",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}