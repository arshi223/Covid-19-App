// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:myapp/Reuseable/Reuseable%20widget.dart';

class Detail extends StatefulWidget {

  String image ;
  String  name ;
  int totalCases , totalDeaths, totalRecovered , active , critical, todayRecovered , test;
   Detail({
    required this.image ,
    required this.name ,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   theme: ThemeData(
    //     brightness: Brightness.dark
    //   ),
    //   debugShowCheckedModeBanner: false,
       //home:
       return Scaffold(
        appBar: AppBar(
          title:  Text(widget.name),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*.06,),
                      ReuseableWidget(title: 'TotalCases', value: widget.totalCases.toString()),
                      ReuseableWidget(title: 'Total Recovered', value: widget.todayRecovered.toString()),
                      ReuseableWidget(title: 'Total Deaths', value: widget.totalDeaths.toString()),
                      ReuseableWidget(title: 'Active', value: widget.active.toString()),
                      ReuseableWidget(title: 'Critical', value: widget.critical.toString()),
                      ReuseableWidget(title: 'Today Recoverd', value: widget.todayRecovered.toString()),
                      ReuseableWidget(title: 'Test', value: widget.test.toString()),
    
                      
    
                    ],
                  ),
                ),
              ),
           CircleAvatar(
            backgroundImage: NetworkImage(widget.image),
           )
            ],
          )
        ],),
    );
  }
}