// ignore_for_file: must_be_immutable, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class ReuseableWidget extends StatelessWidget {
  String title, value;
  ReuseableWidget({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          //SizedBox(height: 5),
          Divider()
        ],
      ),
    );
  }
}
