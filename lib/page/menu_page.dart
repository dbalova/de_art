import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:de_art/page/about_us.dart';
import 'package:de_art/page/application_Page.dart';
import 'package:de_art/page/contacts.dart';
import 'package:de_art/page/qrPage.dart';
import 'package:de_art/page/regPage.dart';
import 'package:de_art/page/select_hotel.dart';
import 'package:de_art/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';
import '../service/api.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}
TextEditingController _passController = TextEditingController();

class _MenuPageState extends State<MenuPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passController.clear();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passController.clear();
  }

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
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) =>
                                  MyHomePage(title: 'De Art 13'),
                            ),
                            (route) =>
                                false, //if you want to disable back feature set to false
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/logoWhite.svg',
                        )))),
            actions: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) =>
                            ApplicationPage()));
                  },
                  child: Container(
                      height: 62,
                      margin: EdgeInsets.only(right: 12, top: 12),
                      child: SvgPicture.asset(
                        'assets/callWhite.svg',
                      )))
            ],
          )),
      body: Column(
        children: [
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 36,
          ),
          TextButton(
              onPressed: () async {
                await select_hotel_info("1");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SelectHotelPage(),
                  ),
                );
              },
              child: Text(
                "Профсоюзная",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
        TextButton(
              onPressed: () async {
                await select_hotel_info("4");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SelectHotelPage(),
                  ),
                );
              },
              child: Text(
                "Таганская",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          TextButton(
              onPressed: () async {
      showDialog(context: context, builder: (BuildContext context){return  AlertDialog(
                  title: Text("Введите код сотрудника",style: TextStyle(color: Palette().red, fontSize: 18,fontWeight: FontWeight.bold),),
                  titleTextStyle:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 20),
                  actionsOverflowButtonSpacing: 20,
                  actions:  [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Palette().red,
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                            ),

                        onPressed: (){
                      if(_passController.text=="1111"){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const SearchObjectPage(),
                                    ),
                                  ); _passController.clear();
                                }
                      else Fluttertoast.showToast(
                          msg: "Неверный код!",
                          toastLength:
                          Toast.LENGTH_SHORT,
                          gravity:
                          ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor:
                          Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                              }, child: Text("Далее",style: TextStyle(color: Colors.white,fontSize: 18),)),

                  ],
                  content: Container(width:MediaQuery.of(context).size.width/3,
                      child:TextField(
                        cursorColor: Palette().red,
                        controller: _passController,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            hintText: "",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Palette().red),
                          ),
                        ),
                      )),
                );});

              },
              child: Text(
                "qr test",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          TextButton(
              onPressed: () async {
            /*   var _res =  FirebaseFirestore.instance.collection("visits").snapshots();
               Map vis = {_res.first.toString():"${_res.last.toString()}"};
               print(vis.toString());*/


              //  FirebaseFirestore.instance.collection("visits").doc('новый телефон').set({'visit':'6'});

               // var _res = await FirebaseFirestore.instance.collection("visits");
                Stream snap =  FirebaseFirestore.instance.collection("visits").snapshots();
                Future<int> ls = snap.length;
               // print("===========================================");
                List<String> _ph = [];

                for(var _i=0; _i<ls; _i++){
             snap.forEach((element) {_ph.add(element.docs[_i].id.toString());});
                }
                print("$_ph===========================================");

              },
              child: Text(
                "fb",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          TextButton(
              onPressed: () async {
                await select_hotel_info("2");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SelectHotelPage(),
                  ),
                );
              },
              child: Text(
                "Новокосино",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          TextButton(
              onPressed: () async {
                await select_hotel_info("5");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SelectHotelPage(),
                  ),
                );
              },
              child: Text(
                "Текстильщики",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          TextButton(
              onPressed: () async {
                await select_hotel_info("6");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SelectHotelPage(),
                  ),
                );
              },
              child: Text(
                "Кропоткинская",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          SizedBox(
            height: 50,
          ),
     
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const regPage(),
                  ),
                );
              },
              child: Text(
                "Лояльность",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const AboutUs(),
                  ),
                );
              },
              child: Text(
                "О De Art 13",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          TextButton(
              onPressed: () async {
                await select_hotel_info("1");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Contacts(),
                  ),
                );
              },
              child: Text(
                "Контакты",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                "+7 (499) 460 52 13",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
        ],
      ),
    );
  }
}
