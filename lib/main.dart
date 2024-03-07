import 'package:cscscsaa/firebase_options.dart';
import 'package:cscscsaa/utilities/routers.dart';
import 'package:cscscsaa/utilities/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// Import the generated file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

@override
  void initState() {

FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
       {
        print('++++++++++++++User is currently signed out!');
      }
    } else {
      {
        print('===================User is signed in!');
      }
    }
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: Theme.of(context).textTheme.titleMedium,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            
          ),
          errorBorder: OutlineInputBorder(  borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,),),
          ),
        useMaterial3: true,
        
      ),
     onGenerateRoute: onGenerate,
     initialRoute: FirebaseAuth.instance.currentUser == null ? AppRoutes.loginPageRoute : AppRoutes.homePageRoute,
    );
  }
}
