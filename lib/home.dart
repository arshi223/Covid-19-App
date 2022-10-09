// ignore_for_file: unused_import, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/Model/world_states.dart';
import 'package:myapp/View/countries.dart';
import 'package:myapp/View/splash_Sc.dart';
import 'package:myapp/View/worldstate.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Covid 19 Tracking App'),
      ),
      body: SplashSc()
      //Worldstate(),
      
      //Countries()
    );
  }
}