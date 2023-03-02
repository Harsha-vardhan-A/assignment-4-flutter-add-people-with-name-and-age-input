// import 'dart:async';
// import 'dart:js';
import 'package:addpeople/provider-files/personsdata.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:addpeople/screens/addperson.dart';
import 'package:addpeople/screens/splashscreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PersonsData(),
      child:const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(Duration(seconds:3), () { Navigator.push(context,MaterialPageRoute(builder: (context) => ())); });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(image: AssetImage("assets/images/people.jpg"))
        // ),
        
      )
      
    );
  }
}
