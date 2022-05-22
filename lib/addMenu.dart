import 'package:flutter/material.dart';

class addMenu extends StatefulWidget {
  const addMenu({Key? key}) : super(key: key);

  @override
  State<addMenu> createState() => _addMenuState();
}

class _addMenuState extends State<addMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          shadowColor: Colors.transparent,
          title: Text('식단표',style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
          backgroundColor: Color.fromRGBO(210, 255, 251, 1)),
      body: ListView()
    );
  }
}
