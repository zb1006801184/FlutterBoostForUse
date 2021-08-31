import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter 页面'),
        leading: GestureDetector(
          child: Container(
            width: 44,
            height: 44,
            child: Center(
              child: Icon(Icons.backspace),
            ),
          ),
          onTap: () {
            //返回原生
            BoostNavigator.instance.pop({'params': 'flutter'});
          },
        ),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: Center(
              child: Text('跳转'),
            ),
          ),
          onTap: () {
            //跳转flutter
            BoostNavigator.instance.push(
              "ViewController", //required
              // withContainer: true,
              arguments: {'params': 'zz'}, //optional
            );
            //跳转原生
          },
        ),
      ),
    );
  }
}
