import 'package:de_art/page/about_us.dart';
import 'package:de_art/page/application_Page.dart';
import 'package:de_art/page/contacts.dart';
import 'package:de_art/page/regPage.dart';
import 'package:de_art/page/select_hotel.dart';
import 'package:de_art/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';
import '../service/api.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette().red,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(78.0),
          child: AppBar(
            backgroundColor: Palette().red,
            leading: Container(
                margin: EdgeInsets.only(left: 12, top: 12),
                height: 62,
                child: SvgPicture.asset(
                  'assets/whiteMenu.svg',
                )),
            title: Center(
                child: Container(
                    height: 55,
                    child: GestureDetector
                      (
                        onTap: (){Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => MyHomePage(title: 'De Art 13'),
                          ),
                              (route) => false,//if you want to disable back feature set to false
                        );},
                        child: SvgPicture.asset(
                          'assets/logoWhite.svg',
                        )))),
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
                        'assets/callWhite.svg',
                      )))
            ],
          )),
      body: Column(children: [
        Divider(color: Colors.white,),
        SizedBox(height:36 ,),
        TextButton(onPressed: (){ Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const SelectHotelPage(),
          ),
        );}, child:Text("Профсоюзная",style: TextStyle(color: Colors.white,fontSize: 18),)),
        TextButton(onPressed: (){ Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const SelectHotelPage(),
          ),
        );}, child:Text("Таганская",style: TextStyle(color: Colors.white,fontSize: 18),)),
        TextButton(onPressed: (){ Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const SelectHotelPage(),
          ),
        );}, child:Text("Новокосино",style: TextStyle(color: Colors.white,fontSize: 18),)),
        TextButton(onPressed: (){ Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const SelectHotelPage(),
          ),
        );}, child:Text("Текстильщики",style: TextStyle(color: Colors.white,fontSize: 18),)),
        TextButton(onPressed: (){ Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const SelectHotelPage(),
          ),
        );}, child:Text("Кропоткинская",style: TextStyle(color: Colors.white,fontSize: 18),)),
SizedBox(height: 50,),
        TextButton(onPressed: ()async{
          await all_list();
          await all_pages();
          await all_reviews();
          await all_hotels_info();
          await select_hotel_info("1");
          await select_page_info("3");
          await select_room_info("108");


          }, child:Text("test",style: TextStyle(color: Colors.white,fontSize: 18),)),
        TextButton(onPressed: (){Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const regPage(),
          ),
        );}, child:Text("Лояльность",style: TextStyle(color: Colors.white,fontSize: 18),)),
        TextButton(onPressed: (){Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const AboutUs(),
          ),
        );}, child:Text("О De Art 13",style: TextStyle(color: Colors.white,fontSize: 18),)),
        TextButton(onPressed: (){  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const Contacts(),
          ),
        );}, child:Text("Контакты",style: TextStyle(color: Colors.white,fontSize: 18),)),
        TextButton(onPressed: (){}, child:Text("+7 (499) 460 52 13",style: TextStyle(color: Colors.white,fontSize: 18),)),
      ],),
    );
  }
}
