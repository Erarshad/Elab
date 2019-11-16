import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import'package:Elab/pages/setup/sign_up.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import'package:Elab/pages/setup/database_helpers.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  String myvar;
  Home({this.myvar});

  @override
  _HomeState createState() => _HomeState(myvar);
}

class _HomeState extends State<Home> {
  String id;
  
  String myvar;
  String course;
  String branch;
  String pc;
  String year;
  //if u want to use date and time in your app then you have to use datetime variable
 DateTime ct = DateTime.now();
  
  _HomeState(this.myvar);
  //for getching automatic time we will use this
  var now = new DateTime.now();
  final databaseReference = Firestore.instance;
  void createRecord() async {
  await databaseReference.collection("LAB RECORD 103")
      .document("$myvar"+"$year"+"$branch"+"$course"+"$ct")
      .setData({
        'Name': '$myvar',
        'Course': '$course',
        'branch':'$branch',
        'year':"$year",
        'system no ':'$pc',
        'Date':(new DateFormat("dd-MM-yyyy").format(now)),
        'Entry time':DateTime.now(),
        //new DateFormat("hh:mm:ss").format(now)
       


      });
   
      
     
 /* DocumentReference ref = await databaseReference.collection("books")
      .add({
        'title': 'Flutter in Action',
        'description': 'Complete Programming Guide to learn Flutter'
      });*/
  //print(ref.documentID);
}
void updateData() {
  try {
    databaseReference
        .collection('LAB RECORD 103')
        .document("$myvar"+"$year"+"$branch"+"$course"+"$ct")
        .updateData({'Exit time':DateTime.now(), });
  } catch (e) {
    print(e.toString());
  }
  
}
//_______lab 105
 void createRecord1() async {
  await databaseReference.collection("LAB RECORD 105")
      .document("$myvar"+"$year"+"$branch"+"$course"+"$ct")
      .setData({
        'Name': '$myvar',
        'Course': '$course',
        'branch':'$branch',
        'year':"$year",
        'system no ':'$pc',
        'Date':(new DateFormat("dd-MM-yyyy").format(now)),
        'Entry time':DateTime.now(),
        //new DateFormat("hh:mm:ss").format(now)



      });
    

 /* DocumentReference ref = await databaseReference.collection("books")
      .add({
        'title': 'Flutter in Action',
        'description': 'Complete Programming Guide to learn Flutter'
      });*/
  //print(ref.documentID);
}
void updateData1() {
  try {
    databaseReference
        .collection('LAB RECORD 105')
        .document("$myvar"+"$year"+"$branch"+"$course"+"$ct")
        .updateData({'Exit time':DateTime.now(), });
  } catch (e) {
    print(e.toString());
  }

}
//_____108_
void createRecord2() async {
  await databaseReference.collection("LAB RECORD 108")
      .document("$myvar"+"$year"+"$branch"+"$course"+"$ct")
      .setData({
        'Name': '$myvar',
        'Course': '$course',
        'branch':'$branch',
        'year':"$year",
        'system no ':'$pc',
        'Date':(new DateFormat("dd-MM-yyyy").format(now)),
        'Entry time':DateTime.now(),
        //new DateFormat("hh:mm:ss").format(now)



      });

 /* DocumentReference ref = await databaseReference.collection("books")
      .add({
        'title': 'Flutter in Action',
        'description': 'Complete Programming Guide to learn Flutter'
      });*/
  //print(ref.documentID);
  
}
void updateData2() {
  try {
    databaseReference
        .collection('LAB RECORD 108')
        .document("$myvar"+"$year"+"$branch"+"$course"+"$ct")
        .updateData({'Exit time':DateTime.now(), });
  } catch (e) {
    print(e.toString());
  }
 
}
void start()
{
   if(id=="103")
    {
     createRecord();
     
   
     
     


   }
   else if(id=="105")
   {
    createRecord1();
   

    
  }
   else if(id=="108")
   {
    createRecord2();
    
    

   }
                     
                      
                      

}
void end()
{
   if(id=="103")
 {
   updateData();

    

   }
     else if(id=="105")
    {
     updateData1();
   

      }
    else if(id=="108")
      {
        updateData2();
       
      
                        

                        

      }
}
 void popup()
 {
   var alertDialog=AlertDialog(
     title: Text("your session is created ✌"),
     content: Text("your session has been successfully created in "+"$id"+"at"+"$ct"),


   );
   showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );
 }
 void popup1()
 {
   var alertDialog=AlertDialog(
     title: Text("your session is Ended ☺"),
     content: Text("your session has been successfully Ended in "+"$id"+"at"+"$ct"),


   );
   showDialog(
     context: context,
     builder: (BuildContext context){
       return alertDialog;
     }

   );
 }
 //for checking internet connection
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
 








  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      appBar: AppBar(

        title: Text("Welcome"+" "+"$myvar"),
        
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        
      ),
      body:Container(child:SingleChildScrollView(
      child: 
      Column(children: <Widget>[
        Container(
          //margin: EdgeInsets.only(top: 50.0),
          //padding: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(4.0),
          height: MediaQuery.of(context).size.height/10,
          width: MediaQuery.of(context).size.width*1.0,
          child:  TextField(
              //this for storing value in text field 
              onChanged:(text){
              course=text;
              },
              textCapitalization: TextCapitalization.sentences,
              //for capitalizing the word in  the text field 

          



             // maxLength: 20,
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.white,
                 filled: true,
                labelText: "Course",
               // helperText: "Enter your name" ,
                border:OutlineInputBorder(),
                prefixIcon: Icon(Icons.book)
              
              
              
              
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
                




              )
                  ),
                  




        
        
        
        
        
        ),
        Container(
          padding: EdgeInsets.all(4.0),
          height: MediaQuery.of(context).size.height/10,
          width: MediaQuery.of(context).size.width*1.0,
          child:
           TextField(
              //this for storing value in text field 
              onChanged:(text){
              branch=text;
              },
              textCapitalization: TextCapitalization.sentences,
              //for capitalizing the word in  the text field 

          



             // maxLength: 20,
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.white,
                 filled: true,
                labelText: "Branch",
               // helperText: "Enter your name" ,
                border:OutlineInputBorder(),
                prefixIcon: Icon(Icons.grade)
              
              
              
              
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
                




              )
                  ),

        
        
        
        
        
        
        ),
        Container(
          padding: EdgeInsets.all(4.0),
          height: MediaQuery.of(context).size.height/10,
          width: MediaQuery.of(context).size.width*1.0,
          child:
             TextField(
              //this for storing value in text field 
              onChanged:(text){
              year=text;
              },
              textCapitalization: TextCapitalization.sentences,
              //for capitalizing the word in  the text field 

          



             // maxLength: 20,
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.white,
                 filled: true,
                labelText: "year",
               // helperText: "Enter your name" ,
                border:OutlineInputBorder(),
                prefixIcon: Icon(Icons.assistant_photo)
              
              
              
              
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
                




              )
                  ),




        ),
        Container(
          padding: EdgeInsets.all(4.0),
          height: MediaQuery.of(context).size.height*0.10,
          width: MediaQuery.of(context).size.width*1.0,
          child: TextField(
              //this for storing value in text field 
              onChanged:(text){
              pc=text;
              },
              textCapitalization: TextCapitalization.sentences,
              //for capitalizing the word in  the text field 

          



             // maxLength: 20,
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.white,
                 filled: true,
                labelText: "System no",
               // helperText: "Enter your name" ,
                border:OutlineInputBorder(),
                prefixIcon: Icon(Icons.computer)
              
              
              
              
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
                




              )
                  ),
                  

        
        
        
        
        ),
        Container(
          padding: EdgeInsets.all(4.0),
          height: MediaQuery.of(context).size.height*0.1,
          width: MediaQuery.of(context).size.width*1.0,
          child:  TextField(
              //this for storing value in text field 
              onChanged:(text){
              id=text;
              },
              textCapitalization: TextCapitalization.sentences,
              //for capitalizing the word in  the text field 

          



             // maxLength: 20,
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.white,
                 filled: true,
                labelText: "Lab id ",
               // helperText: "Enter your name" ,
                border:OutlineInputBorder(),
                prefixIcon: Icon(Icons.format_align_left)
              
              
              
              
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
                




              )
                  ),





        ),
        Container(
                  width: 250.0,
                  //height: MediaQuery.of(context).size.height*0.35,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: ()
                    {
                      start();
                      popup();
                      datainfo();
                     
                     
                        
                     
                      
                      
                     // navigateToSignIn();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Icon(FontAwesomeIcons.school,color: Color(0xffCE107C),),
                      SizedBox(width:20.0),
                      Text(
                      'Start session',
                      style: TextStyle(color: Colors.deepPurple,fontSize: 20.0),
                    ),
                    ],),
                   
                  ),
                )
                ),
                Container(
                  width: 250.0,
                  //height: MediaQuery.of(context).size.height*0.35,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: ()
                    {
                     
                      end();
                      popup1();
                      datainfo();

                  
                      

                     
                      
                      
                     // navigateToSignIn();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Icon(FontAwesomeIcons.eject,color: Color(0xffCE107C),),
                      SizedBox(width:20.0),
                      Text(
                      'End session',
                      style: TextStyle(color: Colors.green,fontSize: 20.0),
                    ),
                    



                    ],),
                   
                  ),
                )
                ),

               
                Container(

                  

                  
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: <Widget>[
                      
                  
                  
                   Image.asset('assets/7.png',height:130.0,width:390,),
                    Text("Proudly made in india with 💛",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 13.0,
                    fontFamily: "Oswald-Medium",
                    fontWeight: FontWeight.bold,
                    fontStyle:FontStyle.italic,

                  
                  
                  
                  ),
                  
                  
                  
                  ),
                  Text("Design and Developed by Mohammad Arshad",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 8.0,
                    fontFamily: "Oswald-Medium",
                    fontWeight: FontWeight.bold,
                    fontStyle:FontStyle.italic,

                  
                  
                  
                  ),
                  
                  
                  
                  ),


                  ],)

                
                
                
                
                ),
                 









      ],),
      
     






         
           
         
         
         
         
         
         
         



        
      
      
      
      
      
      
     

      
    )));
    
  }
}