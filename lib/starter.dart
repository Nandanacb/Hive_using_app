import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_app_new/registerpage.dart';

class Starterpage extends StatefulWidget {
  const Starterpage({super.key});
  @override
  State<Starterpage> createState()=> _StarterpageState();
}
class _StarterpageState extends State<Starterpage>{
  void initState(){
    Timer(const Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>  Registrationpage(),));
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}