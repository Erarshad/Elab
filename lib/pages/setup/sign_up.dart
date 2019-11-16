import 'package:firebase_auth/firebase_auth.dart';
import 'package:Elab/pages/setup/sign_in.dart';
import 'package:flutter/material.dart';
import'package:Elab/pages/setup/sign_up.dart';
import'package:Elab/pages/setup/database_helpers.dart';


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Elab/pages/setup/database_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     //  appBar: new AppBar(),
    
      body:Builder(
        builder: (context) => Stack(
        fit: StackFit.expand,
        children: <Widget>[
           Container(
             width: MediaQuery.of(context).size.width,
             height:  MediaQuery.of(context).size.height,
                child: Image.asset('assets/t.jpg',
                   
                   
                   fit: BoxFit.fill,
                   color: Color.fromRGBO(255, 255, 255, 0.6),
                  colorBlendMode: BlendMode.modulate
                ),
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: <Widget>[
              Container(
              height: MediaQuery.of(context).size.height*0.45,
                
              child:
              Image.asset('assets/1.png')

              )





          ],






          ),
      
      
      
      
      
      Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

          

            
           


            TextFormField(

              validator: (input) {
                if(input.isEmpty){
                  return 'Provide an email';
                }
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                 filled: true,
                 border:OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                labelText: 'Email'
              ),
              onSaved: (input) => _email = input,
            ),
            TextFormField(
              validator: (input) {
                if(input.length < 6){
                  return 'Longer password please';
                }
              },
              decoration: InputDecoration(
                 fillColor: Colors.green,
                 filled: true,
                
                border:OutlineInputBorder(),
                prefixIcon: Icon(Icons.perm_identity),
                labelText: 'Password',
                
              ),
              onSaved: (input) => _password = input,
              obscureText: true,

            ),
           
            
         
            
            RaisedButton(
              onPressed:(){
                signUp();
                
                




              },
              color: Colors.pink,
              
              child: Text('Sign up',style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, 
              
              
              ),),
            ),
          ],
        )
      ),
        ])));
  }
  //__________________________
  


  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){
        print(e.message);
      }
    }
  }
  
}
