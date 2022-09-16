import 'package:firebase_app/providers/providers.dart';
import 'package:firebase_app/screens/first_screen.dart';
import 'package:firebase_app/screens/log_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers:[
      ChangeNotifierProvider<FirebaseProvider>(create: (_)=>FirebaseProvider()),
    ],
      child: MyApp(),),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"FirbaseApp",
      home:FirebaseAuth.instance.currentUser==null? LogInPage(): HomeScreen(),
    );
  }
}

