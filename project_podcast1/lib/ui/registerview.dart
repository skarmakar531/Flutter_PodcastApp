import 'package:flutter/material.dart';

class Registerview extends StatelessWidget{
  final String? title;
  const Registerview({Key?k, this.title}):super(key: k);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title.toString()),
        backgroundColor: Colors.amberAccent,
      ),
      body: const Center(
        child: Text("This is a registration Form"),
      ),
    );
  }
}