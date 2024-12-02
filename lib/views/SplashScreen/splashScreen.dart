import 'dart:async';

import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 3),(timer) {
      Navigator.of(context).pushReplacementNamed('/home');
    },);
    return Scaffold(
      body:Stack(
        children: [

          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/image/splash.jpg')),
            ),

          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            
            color: Colors.black.withOpacity(0.7),
            alignment: Alignment.center,
            child: Text('श्रीमद्भगवद्गीता',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50,letterSpacing: 1),),
          )

        ],
      ),
    );
  }
}
