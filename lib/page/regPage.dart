import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../palette.dart';
import 'application_Page.dart';
import 'menu_page.dart';

class regPage extends StatefulWidget {
  const regPage({super.key});

  @override
  State<regPage> createState() => _regPageState();
}

class _regPageState extends State<regPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: PreferredSize(
        preferredSize: Size.fromHeight(78.0),
        child: AppBar(

          backgroundColor: Colors.white,
          leading:GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MenuPage(),
                  ),
                );
              },
              child: Container(
                  margin: EdgeInsets.only(left: 12, top: 12),
                  height: 62,
                  child: SvgPicture.asset(
                    'assets/menu.svg',
                  ))),
          title: Center(
              child: Container(
                  height: 55,
                  child: SvgPicture.asset(
                    'assets/logo.svg',
                  ))),
          actions: [
            GestureDetector(

                onTap: (){   Navigator.of(context).push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) =>
                        ApplicationPage()));},
                child:Container(
                    height: 62,
                    margin: EdgeInsets.only(right: 12, top: 12),
                    child: SvgPicture.asset(
                      'assets/call.svg',
                    )))
          ],
        )),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Divider(color: Palette().red),
        SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(left: 8,right: 8),
              child:Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child:Text("Добро\nпожаловать!",       style: TextStyle(
                fontSize: 30,
                color: Palette().red,
                fontWeight: FontWeight.bold),textAlign: TextAlign.start,),),
            Text("Зарегистрируйтесь в нашей программе лояльности и получите В ПОДАРОК каждое 10-ое посещение любого из сети отелей De Art 13", style: TextStyle(fontSize: 13),)
          ],))
        ),
      ],
    ),

    );
  }
}
