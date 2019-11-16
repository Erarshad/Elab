import 'package:firebase_auth/firebase_auth.dart';
import 'package:Elab/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:Elab/pages/setup/database_helpers.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   String myvar;
  _save() async {

    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    final value =myvar;
    prefs.setString(key, value);
    print('saved: $myvar');
    
  }
  //_____this is for check internet connection ______ 
  datainfo() async
  {
    // this is the algo of checking internet if not then it will show not connected
    try {
  final result = await InternetAddress.lookup('google.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    print('connected');
    
    
  }
} on SocketException catch (_) {
  print('not connected');
   var alertDialog=AlertDialog(
     title: Text("You Are not connected to 📴 internet dear $myvar"),
     content: Text("please check your internet connection "),


   );
   showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );
}


  }
  //___


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     // appBar: new AppBar(),
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

              TextField(
              //this for storing value in text field 
              onChanged:(text){
              myvar=text;
              },
              textCapitalization: TextCapitalization.sentences,
              //for capitalizing the word in  the text field 

          



             // maxLength: 20,
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.cyanAccent,
                 filled: true,
                labelText: "Name",
               // helperText: "Enter your name" ,
                border:OutlineInputBorder(),
                prefixIcon: Icon(Icons.account_circle)
              
              
              
              
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
                




              )
              
              
              
              ,

             
              
             
              
            ),
            
            TextFormField(
              validator: (input) {
                if(input.isEmpty){
                  return 'Provide an email';
                }
              },
              decoration: InputDecoration(
                fillColor: Colors.cyanAccent,
                filled: true,
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
                fillColor: Colors.white,
                 filled: true,
                labelText: 'Password'
              ),
              onSaved: (input) => _password = input,
              obscureText: true,
            ),
            RaisedButton(
              onPressed:(){
                signIn();
                _save();
                datainfo();

              },
              color: Colors.lightBlue,
              child: Text('Sign in',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, 
              
              
              ),
            ),
            )],
        )
      ),
        ])));
  }

  void signIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(myvar: myvar)));
      }catch(e){
        print(e.message);
      }
    }
  }
}