import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MyA1 extends StatefulWidget {
  @override
  _MyA1State createState() => _MyA1State();
}

class _MyA1State extends State<MyA1> with SingleTickerProviderStateMixin {
  var myanicon;
  var animation;
  var animation1;
   var animation2;
     var animation3;
     Color color;
  MediaQueryData queryData;
  var url="https://github.com/ashimachopra20/animationn/raw/main/NicePng_vintage-arrow-png_3021133.png";
   
  var animationx;
var animationy;

  

  @override
  void initState() {
    super.initState();
  
   
  
    myanicon = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    );

    print(myanicon);

    animation = CurvedAnimation(parent: myanicon, curve: Curves.easeInOutCirc);
    animation1=CurvedAnimation(parent: myanicon, curve: Curves.elasticOut);
    animation2=CurvedAnimation(parent: myanicon, curve: Curves.elasticOut);
    animation3=CurvedAnimation(parent: myanicon, curve: Curves.bounceOut);
     animationx=ColorTween(begin:Colors.yellow[300],end: Colors.pink[100]).animate(myanicon);
      animationy=ColorTween(begin:Colors.yellow[300],end: Colors.white).animate(myanicon)
      ..addListener(() {
        setState(() {
          print(animation.value);
          print(animation1.value);
           print(animation2.value);
            print(animation3.value);
            //animation.value;
             print(animationx.value);
              print(animationy.value);
        });
      });
      

    //print(animation);

    myanicon.forward();
   // print(myanicon);
  }

  @override
  void dispose() {
   
    
    super.dispose();
    myanicon.dispose();
  }

  @override
  Widget build(BuildContext context) {
     queryData = MediaQuery.of(context);
 var mw= queryData.size.width;
var mh=queryData.size.height;
return Scaffold(

body:
  Stack(children: <Widget>[ 
    
     Container(
child:Image.asset('assets/jr-korpa-9XngoIpxcEo-unsplash.jpg')
     ),
 Container(
   
      height: mh*animation.value,
      width: mw*animation.value,
      child:
        RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(myanicon),
              child:Image.asset('assets/jr-korpa-9XngoIpxcEo-unsplash.jpg',fit: BoxFit.cover,)
              
               
            ),
       
    ),
   
  Center(
    child: Container(
      
  decoration: BoxDecoration
  ( border:Border.all(width: 6.0, color: Colors.black),borderRadius: BorderRadius.circular(25)),
      height:100*animation1.value ,
      width:200,

      margin: EdgeInsets.only(
       bottom:(mh/2)*animation2.value/2,
      //left:mw*animation.value-mw/2
      ),
     
      child: Card(
        
        color: Colors.black,

          
         
          child: Center(
            child: Text('WALLPAPER',
            style: TextStyle(
              color: animationx.value,
            fontWeight: FontWeight.bold,fontSize: 30*animation.value
            ),
            ),
          )
          ,),
     
    ),
    ),
    
    
  
   Center(
     child: Container(
       margin: EdgeInsets.only(bottom:4*animation3.value),
       
       child: Center(child: Text('EXPLORE THE BACKGROUNDS',textScaleFactor:0.85,style: TextStyle(color:animationy.value,fontWeight: FontWeight.bold,fontSize: 30*animation.value,fontStyle: FontStyle.italic),))),
   ),
  
   GestureDetector(child:
   Center(
     child: Container(
       margin: EdgeInsets.only(top:300),
       height:150,      
  width: 150*animation3.value,
  
  //color: Colors.orange,
     //padding: EdgeInsets.all(60),
     //margin: EdgeInsets.only(bottom:300.0),
    /* decoration: BoxDecoration(
       //color:Colors.pinkAccent,
       border:Border.all(width: 6.0, color:Colors.pinkAccent),
      borderRadius: BorderRadius.circular(100),
      */
      
     child:Image.asset("assets/Arrow-PNG-Clipart.png"), 
      //color:Colors.blueGrey,
     ),
      //color:Colors.blueGrey,
     ),
   
   //alignment: AlignmentDirectional.topCenter,
  
   
   onTap: (){
     Navigator.pushNamed(context,'/wp');
   }
   ,),
   Container(
       margin: EdgeInsets.only(bottom:15),
       height:150,      
  //width: 150*animation3.value,
  
  //color: Colors.orange,
     //padding: EdgeInsets.all(60),
     //margin: EdgeInsets.only(bottom:300.0),
    /* decoration: BoxDecoration(
       //color:Colors.pinkAccent,
       border:Border.all(width: 6.0, color:Colors.pinkAccent),
      borderRadius: BorderRadius.circular(100),
      */
      
      child:Center(child:Image.asset("assets/—Pngtree—digital social media device phone_5442609.png"),), 
      //color:Colors.blueGrey,
     ),
      //color:Colors.blue
],
));
 


}}
    