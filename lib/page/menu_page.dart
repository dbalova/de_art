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
import 'package:url_launcher/url_launcher.dart';

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

          /*TextButton(
              onPressed: () async {
            *//*   var _res =  FirebaseFirestore.instance.collection("visits").snapshots();
               Map vis = {_res.first.toString():"${_res.last.toString()}"};
               print(vis.toString());*//*

print('НАЖАЛИ');
              //  FirebaseFirestore.instance.collection("visits").doc('новый телефон').set({'visit':'6'});


                 QuerySnapshot qSnap = await FirebaseFirestore.instance.collection('visits').get();
                 int documents = qSnap.docs.length;



List<String> _ph = [];
                for(var _i=0; _i<  documents; _i++){
                 _ph.add(qSnap.docs[_i].id.toString()) ;

                }

               if(_ph.contains("09090909")){
                 int _phoneIndex=0;
                 _phoneIndex= _ph.indexOf("09090909");
                 int _phoneVisit=0;
                 
                 await FirebaseFirestore.instance.collection("visits").get().then((snapshot) {
                   _phoneVisit = int.parse(snapshot.docs[_phoneIndex].get('visit').toString());
                   print('получили визиты $_phoneVisit');
                 });
                 print('НАЖАЛИ ${_phoneIndex} ${_phoneVisit}');
                 _phoneVisit++;
                 if(_phoneVisit==10){
                   await FirebaseFirestore.instance.collection("visits").doc("09090909").set({'visit':'0'});
                   showDialog(context: context, builder: (BuildContext context){
                     return  AlertDialog(
                     title: Text("Бесплатное посещение!",style: TextStyle(color: Palette().red, fontSize: 18,fontWeight: FontWeight.bold),),
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
Navigator.pop(context);
                           }, child: Text("Далее",style: TextStyle(color: Colors.white,fontSize: 18),)),

                     ],
                     content: Container(width:MediaQuery.of(context).size.width/3,
                         child:Text('Посетителю доступно 10-ое бесплатное посещение в подарок в одном из предложенных номеров De Art 13.')),
                   );});
                 }else {
                    FirebaseFirestore.instance
                        .collection("visits")
                        .doc("09090909")
                        .set({'visit': _phoneVisit.toString()});
                  }
                  print('НАЖАЛИ новый визит!${_ph}');
               }else{ FirebaseFirestore.instance.collection("visits").doc("09090909").set({'visit':'1'});}

              },
              child: Text(
                "fb",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),*/
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
            height: 30,
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
                "Программа лояльности",
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
                "Страница сотрудника",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          SizedBox(
            height: 30,
          ),

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
              onPressed: () async{
                final Uri url =
                Uri.parse('https://deart-13.ru/rabota/');
                if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
                }
              },
              child: Text(
                "Вакансии",
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
