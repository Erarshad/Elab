import 'package:Elab/pages/setup/sign_in.dart';
import 'package:Elab/pages/setup/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
    
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
              // crossAxisAlignment: CrossAxisAlignment.start,
                
                children: <Widget>[
                  
              
                 Container(
                   height: MediaQuery.of(context).size.height*0.25,
                   
                   
                   
                   child: 

                 
                  
                  
                  Image.asset('assets/jit.png'),
           

                 ),
                 Container(
                height: MediaQuery.of(context).size.height*0.40,
                



                child:
                 
                 Image.asset('assets/1.png'),

                 )
                 
                  
                  


                
                 





              ],),
              
               Column(
           mainAxisAlignment: MainAxisAlignment.end,
          
            children: <Widget>[
              SizedBox(height:10.0),
             Container(
                  width: 250.0,
                  //height: MediaQuery.of(context).size.height*0.35,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: ()
                    {
                      navigateToSignIn();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Icon(FontAwesomeIcons.signInAlt,color: Color(0xffCE107C),),
                      SizedBox(width:20.0),
                      Text(
                      'Sign in ',
                      style: TextStyle(color: Colors.deepPurple,fontSize: 20.0),
                    ),
                    ],),
                   
                  ),
                )
                ),
                 Container(
                  width: 250.0,
                 // height: MediaQuery.of(context).size.height*0.10,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Icon(FontAwesomeIcons.sign,color: Color(0xff4754de),),
                      SizedBox(width:20.0),
                      Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.green,fontSize: 20.0),
                    ),
                    ],),
                    onPressed: () {

                      navigateToSignUp();


                    },
                  ),
                )
                ),


              
        
      
      













   
         ],
        )])));
      
      
      
  
      
    
    
    
  }

  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}
