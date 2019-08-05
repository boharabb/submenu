import 'package:flutter/material.dart';
import 'package:submenu/menu_dashboard_layout.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter demo",
      theme: ThemeData(primarySwatch: Colors.blueGrey
      ),
    
      home: MenuDashboardPage(),
    );
  }
}