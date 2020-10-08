import 'package:AnimationApp/MyAnim.dart';
import 'package:flutter/material.dart';
import 'MyAnim.dart';
import 'MyWallpaper.dart';








void main() {
  

  runApp(MaterialApp(
    
 
      initialRoute: "/",
    routes: {
   "/":(context)=> MyA1(),
      "/wp":(context)=> Mywp(),
    
  

    },
    debugShowCheckedModeBanner: false,
  ));
}

