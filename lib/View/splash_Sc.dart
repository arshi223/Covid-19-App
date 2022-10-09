// ignore_for_file: file_names, prefer_const_constructors, library_private_types_in_public_api, unused_local_variable, sized_box_for_whitespace

import 'dart:async';


import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:myapp/View/worldstate.dart';

class SplashSc extends StatefulWidget {
  const SplashSc({Key? key}) : super(key: key);

  @override
  _SplashScState createState() => _SplashScState();
}

class _SplashScState extends State<SplashSc> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Worldstate())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: _controller,
                  child: Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Image.asset('assets/images/virus.png'),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi,
                      child: child,
                    );
                  }),
              SizedBox(
                height: size.height * .08,
              ),
              Align(
                alignment: Alignment.center,
                child: const Text(
                  'Covid-19\n Tracker App',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              )
            ]),
      ),
    );
  }
}
