import 'dart:async';

import 'package:flutter/material.dart';
import 'package:addpeople/screens/addperson.dart';
// import 'package:addpeople/addperson.dart';
// import 'package:async/async.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:3), () { Navigator.push(context,MaterialPageRoute(builder: (context) => AddPeople())); });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(image: AssetImage("assets/images/people.jpg"))
        // ),
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Image.asset("assets/images/people.jpg",),
            // ImageIcon(AssetImage("assets/images/people.jpg"),),
            const SizedBox(
              height: 40,
            ),
            const Text("People",style: TextStyle(fontSize: 50),),
          ],
        ),
      ),
      ),
    );
  }
}