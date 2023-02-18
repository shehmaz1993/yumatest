import 'package:flutter/material.dart';
import 'package:yuma_test/SIgnIn/sign_in.dart';
import 'package:yuma_test/SIgnUp/sign_up.dart';
import 'package:provider/provider.dart';

import 'SIgnIn/sign_in_info.dart';
import 'SIgnUp/sign_up_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (context)=>SignUpInfo(),
          child: const SignUpPage(),
        ),
        ChangeNotifierProvider(
          create: (context)=>SignInInfo(),
          child: const SignInPage(),
        ),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:SignUpPage(),

      ),
    );
  }
}

