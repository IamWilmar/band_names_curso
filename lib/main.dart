import 'package:band_names/pages/status_page.dart';
import 'package:band_names/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:band_names/pages/home_page.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName    : (BuildContext context) => HomePage(),
          StatusPage.routeName  : (BuildContext context) => StatusPage(),
        },
      ),
    );
  }
}