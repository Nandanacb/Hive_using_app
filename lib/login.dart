import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_app_new/shoppage.dart';

class Loginpage extends StatefulWidget{
  @override
  State<Loginpage> createState()=> _LoginpageState();
}

class  _LoginpageState extends State<Loginpage>{
  late Box box;
   TextEditingController usernameController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  String _loginmessage="";
  @override
  void initState(){
    super.initState();
    box=Hive.box('mybox');
  }
  void _login(){
   setState(() {
     String storedusername=box.get('username');
     String storedpassword=box.get('password');

     if(storedusername==usernameController.text && 
     storedpassword==passwordController.text){
      _loginmessage="Login successful";
     }
     else{
      _loginmessage="invalid credentials";
     }
   });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page Example"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text("Username"),
              SizedBox(height: 20,),
              SizedBox(
                height: 100,
                width: 300,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 50,),
              Text("password"),
              SizedBox(height: 20,),
              SizedBox(
                height: 100,
                width: 300,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(border: OutlineInputBorder()),),
              ),
          
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
               _login();
               Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstPage()));
              },
               child: Text("Login")),
              
               Text(_loginmessage,),
               
            ],
          ),
        ),
      ),
      
    );
  }
}