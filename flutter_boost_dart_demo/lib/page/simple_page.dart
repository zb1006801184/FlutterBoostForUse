import 'package:flutter/material.dart';

class SimplePage extends StatefulWidget {
 final dynamic data;
  SimplePage({Key key,this.data}):super(key: key);
  @override
  _SimplePageState createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('${widget.data}'));
  }
}