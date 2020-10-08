import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';



class Mywp extends StatefulWidget {
  @override
  _MywpState createState() => _MywpState();
}

class _MywpState extends State<Mywp>
    with SingleTickerProviderStateMixin {
       String _wallpaperAsset = 'Unknown';
 
 var myanicon;
  var animation;
  var animation1;
   var animation2;
     var animation3;
     var animationy;
  MediaQueryData queryData;
 
  
   Future<void> setWallpaperFromAsset() async {
    setState(() {
      _wallpaperAsset = "Loading";
    });
    String result;
    String assetPath = "assets/im2.jpg";
    
  
      result = await WallpaperManager.setWallpaperFromAsset(
          assetPath, WallpaperManager.HOME_SCREEN);
    
     // result = 'Failed to get wallpaper.';
    

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _wallpaperAsset = result;
    });
  }

  // Platform me

  

  @override
  void initState() {
    super.initState();
    myanicon = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    print(myanicon);

    animation = CurvedAnimation(parent: myanicon, curve: Curves.easeInOutCirc);
    animation1=CurvedAnimation(parent: myanicon, curve: Curves.elasticOut);
    animation2=CurvedAnimation(parent: myanicon, curve: Curves.elasticOut);
    animation3=CurvedAnimation(parent: myanicon, curve: Curves.easeInCirc);
    animationy=ColorTween(begin:Colors.red,end: Colors.blueGrey).animate(myanicon)
      ..addListener(() {
        setState(() {
          print(animation.value);
          print(animation1.value);
           print(animation2.value);
            print(animation3.value);
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
var myi=Icon(Icons.check_circle);
return Scaffold(
  appBar: AppBar(
    title:Center(child: Text('CHOOSE WALLPAPER ',textAlign:TextAlign.center,style:TextStyle(fontStyle: FontStyle.italic),)),
    backgroundColor: Colors.black,
  ),

 body: Stack(children: <Widget>[ 
     
 
    ListView(
  // This next line does the trick.
  scrollDirection: Axis.horizontal,
  children: <Widget>[
   
    Container(
      width: mw,
      height:30.0,
      color: Colors.black,
       child:Stack(children:<Widget>[
         
       RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(myanicon),child:Stack(
                children: <Widget>[
                  Center(child: Image.asset('assets/pexels-pixabay-414860.jpg',fit: BoxFit.cover,)),
                  
              
                ],)
       )]),),
               Container(
      width: mw,
      height:30.0,
     color: animationy.value,
       child:
       ListView(
  // This next line does the trick.
  scrollDirection: Axis.vertical,
  children: <Widget>[
     
                  /*  Checkbox(  
                      checkColor: Colors.greenAccent,  
                      activeColor: Colors.red,  
                      value: this.valuefirst,  
                      onChanged: (bool value) {  
                        setState(() {  
                          this.valuefirst = value;  
                        });  
                      },  
                    ),
                    */  
    SizedBox(height:100, width:100),
   Container(
        height:300 ,
        width:mw,
        child:Image.asset('assets/cyberpunk.jpg')),
        IconButton(icon: myi, onPressed: setWallpaperFromAsset,splashColor: Colors.red,color:Colors.black ,),
    
    
        
        SizedBox(height:100, width:100),
         Container(
      height:300 ,
      width:mw ,
      child:Image.asset('assets/im2.jpg'),
        
         ),
          IconButton(icon: myi, onPressed: setWallpaperFromAsset,splashColor: Colors.red,color:Colors.black ,),
    
    Center(child: Card(child: Text('Wallpaper status: $_wallpaperAsset\n'))),
         SizedBox(height:100, width:100),
         Container(
      height:300 ,
      width:mw ,
      child:Image.asset('assets/mourad-saadi-GyDktTa0Nmw-unsplash.jpg'),
        
         ),
          IconButton(icon: myi, onPressed: setWallpaperFromAsset,splashColor: Colors.red,color:Colors.black ,),
    
   
         SizedBox(height:100, width:100),
         Container(
      height:300 ,
      width:mw ,
      child:Image.asset('assets/pexels-andre-moura-4021521.jpg'),
        
         ),
          IconButton(icon: myi, onPressed: setWallpaperFromAsset,splashColor: Colors.red,color:Colors.black ,),
    
   
         SizedBox(height:100, width:100),
         Container(
      height:300 ,
      width:mw ,
      child:Image.asset('assets/pawel-czerwinski-6lQDFGOB1iw-unsplash.jpg'),
        
         ),
          IconButton(icon: myi, onPressed: setWallpaperFromAsset,splashColor: Colors.red,color:Colors.black ,),
    
   
        
  ]
     ) )]
                )
  ] ) );

 


}}