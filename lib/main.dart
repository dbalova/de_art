import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'De Art 13',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(114, 40, 57, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'De Art 13'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(78.0),
          child:AppBar(

        backgroundColor: Colors.white,
leading: Container(
  margin: EdgeInsets.only(left: 12,top: 12),
    height: 62,

    child:SvgPicture.asset(
      'assets/menu.svg',

    )),
        title: Center(child:Container(
            height: 55,

            child:SvgPicture.asset(
          'assets/logo.svg',

        ))),
        actions: [Container(
            height: 62,
            margin: EdgeInsets.only(right: 12,top: 12),
            child:SvgPicture.asset(
              'assets/call.svg',

            ))],


      )),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Container(child:
           Image.asset("assets/hotel.png"),)

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
