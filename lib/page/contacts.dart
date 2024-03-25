import 'package:de_art/custom_widget/how_to_get.dart';
import 'package:de_art/page/select_hotel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../custom_widget/buttonModel.dart';
import '../custom_widget/footer.dart';
import '../main.dart';
import '../palette.dart';
import 'Map.dart';
import 'application_Page.dart';
import 'menu_page.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      gg().then(() {mapController.moveCamera(
        animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(
              latitude: 55.7522200,
              longitude:37.6155600,

            ),
            zoom: 10,
          ),
        ),
      );
      setState(() {});
      });
    });
    super.initState();
  }
  gg(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(78.0),
          child: AppBar(
            backgroundColor: Colors.white,
            leading: GestureDetector(
                onTap: (){  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MenuPage(),
                  ),
                );},
                child:Container(
                margin: const EdgeInsets.only(left: 12, top: 12),
                height: 62,
                child: SvgPicture.asset(
                  'assets/menu.svg',
                ))),
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
                          'assets/logo.svg',
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
                        'assets/call.svg',
                      )))
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Контакты",
                      style: TextStyle(
                          fontSize: 30,
                          color: Palette().red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Text(
                              "Профсоюзная",
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 24,),
                      Column(
                        children: [
                          Container(
                            child: Text(
                              "Таганская",
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),SizedBox(width: 24,),
                      Column(
                        children: [
                          Container(
                            child: Text(
                              "Новокосино",
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [ Column(
                    children: [
                      Container(
                        child: Text(
                          "Текстильщики",
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                            BorderSide(width: 1.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),SizedBox(width: 24,),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "Кропоткинская",
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                              BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),],),
                  const Padding(
                    padding: EdgeInsets.only(top: 28.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.place),
                        ),
                        Text("Москва, ул. Артюхиной, 14/8 , стр. 1")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.call),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: Text(
                              "+7(925)-288-33-13      +7(499)-178-10-68",
                              overflow: TextOverflow.clip,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 36.0, bottom: 24),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Как добраться:",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: HowToGet(
                        context,
                        'assets/IconBus.svg',
                        "Общественным транспортом:",
                        " от метро Текстильщики на автобусе №530 до остановки Люблинская улица. Далее пешком прямо до пересечения с ул. Артюхиной, затем повернуть направо."),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: HowToGet(
                        context,
                        'assets/IconHuman.svg',
                        "Пешком:",
                        " выход из метро Текстильщики в сторону Люблинской, далее мимо культурного центра Москвич и спортивного клуба Москвич. Далее по Люблинской до дома 17 к.1,"
                            " после магазина Пятерочка повернуть налево.Далее до 1-й ул.Текстильщиков, мимо школы № 2010, затем направо, по Артюхиной вдоль аллеи Славы. Перейти ул. Юных Ленинцев, прямо по тротуару."),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) =>
                                    SelectHotelPage()));
                          },
                          child:RedButton(Palette().red, "Подобрать номера",
                          Palette().white, 15, FontWeight.bold)),
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) =>
                                    ApplicationPage()));
                          },

                          child:RedButton(Palette().red, "Написать нам",
                          Palette().white, 15, FontWeight.bold)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24, top: 24),
                    child: Image.asset("assets/4.png"),
                  ),
                ],
              ),
            ),
            miniMap(context)
            /*Footer(context)*/
          ],
        ),
      ),
    );
  }
}
