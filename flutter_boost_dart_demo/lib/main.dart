import 'package:flutter/material.dart';
import 'package:flutter_boost/boost_flutter_binding.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_boost_dart_demo/page/home_page.dart';
import 'package:flutter_boost_dart_demo/page/simple_page.dart';



class CustomFlutterBinding extends WidgetsFlutterBinding with BoostFlutterBinding {

}
void main() {
  //在runApp之前确保BoostFlutterBinding初始化
  CustomFlutterBinding();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ///路由表
  static Map<String, FlutterBoostRouteFactory> routerMap = {
    'homePage': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) {
            return HomePage();
          });
    },
    'simplePage': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => SimplePage(
            data: settings.arguments,
          ));
    },
  };

  Route<dynamic> routeFactory(RouteSettings settings, String uniqueId) {
    FlutterBoostRouteFactory func = routerMap[settings.name];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(routeFactory);
  }
}

