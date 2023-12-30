import 'package:de_art/buttonModel.dart';
import 'package:de_art/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

List<bool>_metro=[false,false,false,false];
List<bool> _time=[false,false,false,false,false,];
List<bool> _typeBed=[false,false,false,];


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'De Art 13',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(114, 40, 57, 1)),
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
          child: AppBar(
            backgroundColor: Colors.white,
            leading: Container(
                margin: EdgeInsets.only(left: 12, top: 12),
                height: 62,
                child: SvgPicture.asset(
                  'assets/menu.svg',
                )),
            title: Center(
                child: Container(
                    height: 55,
                    child: SvgPicture.asset(
                      'assets/logo.svg',
                    ))),
            actions: [
              Container(
                  height: 62,
                  margin: EdgeInsets.only(right: 12, top: 12),
                  child: SvgPicture.asset(
                    'assets/call.svg',
                  ))
            ],
          )),
      body: SingleChildScrollView(
          child: Container(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Stack(
              children: [
                Image.asset("assets/hotel.png"),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 560,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black, Colors.transparent]))),
                Container(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 20, right: 20),
                    height: 560,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Отели на час в Москве',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Четыре великолепных бутик-отеля «Де-Арт 13» рассчитаны на небольшое количество постояльцев, которым предлагаются номера с уникальными, продуманными до мелочей интерьерами.',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        button(
                            Color.fromRGBO(255, 255, 255, 1),
                            "Бронировать",
                            Color.fromRGBO(114, 40, 57, 1),
                            15,
                            FontWeight.bold),
                        Text(
                          'Это прекрасная альтернатива крупным столичным гостиницам с типовыми номерами.',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 26, bottom: 26, left: 26, right: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/filtr.svg',
                ),
                Text("Показать фильтры",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),

          Column(children: [
            Image.asset("assets/Map.png"),
          Padding(
              padding: EdgeInsets.only(top:24, bottom: 24,left: 12,right: 12),
              child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Spacer(flex:1),
              Text("Показать фильтры", style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(flex:1),
              Icon( Icons.cancel_outlined, color: Palette().red,)

            ],)),
            Text("Метро:", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(

              children: [
                GestureDetector(
                    onTap: (){_metro[0]=!_metro[0];
                      setState(() {

                      });
                      },
                    child:Container(
                        margin: EdgeInsets.only(top:8, bottom: 8,left: 4,right: 4),
                  padding: EdgeInsets.only(top:10, bottom: 10,left: 12,right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color:_metro[0]? Colors.yellowAccent: Colors.grey.shade300
                    ),
                    child: Text('Профсоюзная'))),
                GestureDetector(
                    onTap: (){_metro[1]=!_metro[1];
                    setState(() {

                    });
                    },
                    child:Container(
                        margin: EdgeInsets.only(top:8, bottom: 8,left: 4,right: 4),
                        padding: EdgeInsets.only(top:10, bottom: 10,left: 12,right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color:_metro[1]? Colors.yellowAccent: Colors.grey.shade300
                        ),
                        child: Text('Таганская'))),
                GestureDetector(
                    onTap: (){_metro[2]=!_metro[2];
                    setState(() {

                    });
                    },
                    child:Container(
                        margin: EdgeInsets.only(top:8, bottom: 8,left: 4,right: 4),
                        padding: EdgeInsets.only(top:10, bottom: 10,left: 12,right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color:_metro[2]? Colors.yellowAccent: Colors.grey.shade300
                        ),
                        child: Text('Новокосино'))),
                GestureDetector(
                    onTap: (){_metro[3]=!_metro[3];
                    setState(() {

                    });
                    },
                    child:Container(
                        margin: EdgeInsets.only(top:8, bottom: 8,left: 4,right: 4),
                        padding: EdgeInsets.only(top:10, bottom: 10,left: 12,right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color:_metro[3]? Colors.yellowAccent: Colors.grey.shade300
                        ),
                        child: Text('Текстильщики'))),

              ],
            ),
            Text("Время:", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(

                children: [
                GestureDetector(
                    onTap: (){_time[0]=!_time[0];
                    setState(() {

                    });
                    },
                    child:Container(
                        margin: EdgeInsets.only(top:8, bottom: 8,left: 4,right: 4),
                        padding: EdgeInsets.only(top:10, bottom: 10,left: 12,right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color:_time[0]? Colors.yellowAccent: Colors.grey.shade300
                        ),
                        child: Text('От 1 часа'))),
                GestureDetector(
                    onTap: (){_time[1]=!_time[1];
                    setState(() {

                    });
                    },
                    child:Container(
                        margin: EdgeInsets.only(top:8, bottom: 8,left: 4,right: 4),
                        padding: EdgeInsets.only(top:10, bottom: 10,left: 12,right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color:_time[1]? Colors.yellowAccent: Colors.grey.shade300
                        ),
                        child: Text('От 2 часов'))),
                GestureDetector(
                    onTap: (){_time[2]=!_time[2];
                    setState(() {

                    });
                    },
                    child:Container(
                        margin: EdgeInsets.only(top:8, bottom: 8,left: 4,right: 4),
                        padding: EdgeInsets.only(top:10, bottom: 10,left: 12,right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color:_time[2]? Colors.yellowAccent: Colors.grey.shade300
                        ),
                        child: Text('От 3 часов'))),
                GestureDetector(
                    onTap: (){_time[3]=!_time[3];
                    setState(() {

                    });
                    },
                    child:Container(
                        margin: EdgeInsets.only(top:8, bottom: 8,left: 4,right: 4),
                        padding: EdgeInsets.only(top:10, bottom: 10,left: 12,right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color:_time[3]? Colors.yellowAccent: Colors.grey.shade300
                        ),
                        child: Text('На ночь'))),
                GestureDetector(
                    onTap: (){_time[4]=!_time[4];
                    setState(() {

                    });
                    },
                    child:Container(
                        margin: EdgeInsets.only(top:8, bottom: 8,left: 4,right: 4),
                        padding: EdgeInsets.only(top:10, bottom: 10,left: 12,right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color:_time[4]? Colors.yellowAccent: Colors.grey.shade300
                        ),
                        child: Text('На сутки'))),

              ],
            ),
            Text("Тип кровати:", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(

              children: [
                GestureDetector(
                    onTap: (){_typeBed[0]=!_typeBed[0];
                    setState(() {

                    });
                    },
                    child:Container(
                        margin: EdgeInsets.only(top:8, bottom: 8,left: 4,right: 4),
                        padding: EdgeInsets.only(top:10, bottom: 10,left: 12,right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color:_typeBed[0]? Colors.yellowAccent: Colors.grey.shade300
                        ),
                        child: Text('Круглая'))),
                GestureDetector(
                    onTap: (){_typeBed[1]=!_typeBed[1];
                    setState(() {

                    });
                    },
                    child:Container(
                        margin: EdgeInsets.only(top:8, bottom: 8,left: 4,right: 4),
                        padding: EdgeInsets.only(top:10, bottom: 10,left: 12,right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color:_typeBed[1]? Colors.yellowAccent: Colors.grey.shade300
                        ),
                        child: Text('Обычная двуспальная'))),
                GestureDetector(
                    onTap: (){_typeBed[2]=!_typeBed[2];
                    setState(() {

                    });
                    },
                    child:Container(
                        margin: EdgeInsets.only(top:8, bottom: 8,left: 4,right: 4),
                        padding: EdgeInsets.only(top:10, bottom: 10,left: 12,right: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color:_typeBed[2]? Colors.yellowAccent: Colors.grey.shade300
                        ),
                        child: Text('Большая двуспальная'))),


              ],
            ),




          ],),
          Text(
            'Отель на Профсоюзной',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Palette().red),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
            decoration: BoxDecoration(color: Color.fromRGBO(245, 245, 245, 1)),
            child: Column(
              children: [
                Container(height: 265, child: Image.asset("assets/sea.png")),
                Container(
                    padding: EdgeInsets.only(
                        left: 12, top: 12, right: 12, bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            child:Text(
                          '209 Cтандарт Морской с джакузи',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 12, top: 12,left: 12, right: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/time1.svg',
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Час',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          '750 ₽',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                                Container(
                                    child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/time12.svg',
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ночь',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          '3 500 ₽',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                                Container(
                                    child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/time24.svg',
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Сутки',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          '4 500 ₽',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 12, top: 12,left: 12,right: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/mark.svg',
                                ),
                                SizedBox(width: 12,),
                                Text(
                                  'Профсоюзная',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                                Text(
                                  'Подробнее',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 2,
                                      fontSize: 18),
                                ),
                              ],
                            )),
                     Padding(
                         padding: EdgeInsets.only(left: 12,right: 12),
                         child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/stars.svg',
                            ),
                            button(Palette().red, "Бронировать",
                                Palette().white, 15, FontWeight.normal),
                          ],
                        )),
                      ],
                    ))
              ],
            ),
          ),
          button(Palette().red, "Все номера", Palette().white, 15,
              FontWeight.bold),
          Padding(
              padding:
                  EdgeInsets.only(bottom: 12, top: 12, left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Отзывы',
                    style: TextStyle(
                        fontSize: 18,
                        color: Palette().red,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Смотреть все отзывы',
                    style: TextStyle(fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        fontSize: 18),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, bottom: 12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Palette().red,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Антон",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SvgPicture.asset(
                  'assets/stars.svg',
                ),
                Text(
                  "Хорошая гостиница в красивом районе. На Таганской выбор отелей на час не так велик, так что Де Арт прямо спасение. Мы брали Английский номер, остались всем довольны. Советую бронировать заранее",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "18 ноября 2022 г.",
                  style: TextStyle(
                      fontSize: 13, color: Color.fromRGBO(74, 74, 74, 1)),
                ),
              ],
            ),
          ),
        Row(children: [
          Spacer(flex:3),
          SvgPicture.asset(
            'assets/left.svg',
          ),
          Spacer(flex:1),
          SvgPicture.asset(
            'assets/right.svg',
          ),
          Spacer(flex:3),
        ],),

          Align(
              alignment: Alignment.centerLeft,
              child:  Padding(
                  padding: EdgeInsets.only(
                      top: 24,
                      bottom: 12,
                      left: 12
                  ),
                  child: Text(
                    'Сеть дизайнерских отелей De Art 13',
                    style: TextStyle(
                        fontSize: 18,
                        color: Palette().red,
                        fontWeight: FontWeight.bold),
                  ))),

          ExpansionTile(
            shape: Border(),
            trailing: Icon(Icons.expand_more,size: 40,color:Palette().red ),
            title: Text('Отель на Профсоюзной',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),),

            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top:24,bottom: 24, left: 12, right: 12),
                    child: Image.asset("assets/1.png"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/loc.svg',
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          padding: EdgeInsets.only(right: 12),
                          child: RichText(text:TextSpan(

                              children: [
                                TextSpan(
                                  text: 'Расположение:',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' гостиница находится на юго-западе Москвы в тихом районе с хорошей транспортной развязкой. В пешей доступности — станции метро Новые Черемушки, Калужская, Профсоюзная.',
                                  style: TextStyle(
                                      fontSize: 16,color: Colors.black
                                  ),
                                )
                              ]
                          ))),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/infr.svg',
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          padding: EdgeInsets.only(right: 12),
                          child:

                          RichText(text:TextSpan(

                              children: [
                                TextSpan(
                                  text: 'Инфраструктура:',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' на территории — уютный ресторан, бар. Частная охраняемая парковка. Бесплатный Wi-Fi.',
                                  style: TextStyle(
                                      fontSize: 16,color: Colors.black
                                  ),
                                )
                              ]
                          ))

                        /*Text(
                          'Инфраструктура: на территории — уютный ресторан, бар. Частная охраняемая парковка. Бесплатный Wi-Fi.', style: TextStyle(
                          fontSize: 14,
                        ),
                        )*/),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/number.svg',
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          padding: EdgeInsets.only(right: 12),
                          child:

                          RichText(text:TextSpan(

                              children: [
                                TextSpan(
                                  text: 'Номера:',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' 13 номеров: несколько стандартах, улучшенные, Delux, лофт. Все оформленных в индивидуальном стиле. Каждый номер укомплектован необходимой мебелью и сантехникой.',
                                  style: TextStyle(
                                      fontSize: 16,color: Colors.black
                                  ),
                                )
                              ]
                          ))


                        /*Text(
                          'Номера: 13 номеров: несколько стандартах, улучшенные, Delux, лофт. Все оформленных в индивидуальном стиле. Каждый номер укомплектован необходимой мебелью и сантехникой.', style: TextStyle(
                          fontSize: 14,
                        ),
                        )*/),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/iconFood.svg',
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          padding: EdgeInsets.only(right: 12),
                          child:

                          RichText(text:TextSpan(

                              children: [
                                TextSpan(
                                  text: 'Предложены',
                                  style: TextStyle(fontSize: 16,color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' дополнительные услуги:',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' индивидуальный трансфер, завтрак.',
                                  style: TextStyle(
                                      fontSize: 16,color: Colors.black
                                  ),
                                )
                              ]
                          ))

                        /*Text(
                          'Предложены дополнительные услуги: индивидуальный трансфер, завтрак.', style: TextStyle(
                          fontSize: 14,
                        ),
                        )*/),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top:24, bottom: 12,left: 12,right: 12),
                      child: button(Palette().red,"Посмотреть номера",Colors.white,13,FontWeight.bold)),
                ],)
            ],
          ),
          Padding(
              padding:
              EdgeInsets.only(left: 12, right: 12,  bottom: 4),
              child: Divider(
                color: Palette().red,
                thickness: 3,
              )),
          ExpansionTile(
            shape: Border(),
            trailing: Icon(Icons.expand_more,size: 40,color:Palette().red ),
            title: Text('Отель на Таганской',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),),

            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top:24,bottom: 24, left: 12, right: 12),
                    child: Image.asset("assets/2.png"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/loc.svg',
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          padding: EdgeInsets.only(right: 12),
                          child: RichText(text:TextSpan(

                              children: [
                                TextSpan(
                                  text: 'Расположение:',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' почасовой мини-отель De Art 13 находится рядом с метро Таганская всего в нескольких минутах ходьбы.',
                                  style: TextStyle(
                                      fontSize: 16,color: Colors.black
                                  ),
                                )
                              ]
                          ))),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/infr.svg',
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          padding: EdgeInsets.only(right: 12),
                          child:

                          RichText(text:TextSpan(

                              children: [
                                TextSpan(
                                  text: 'Инфраструктура:',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' на территории отеля – охраняемая парковка. Бесплатный Wi-Fi в каждом номере. Рядом с отелем находятся исторические достопримечательности.',
                                  style: TextStyle(
                                      fontSize: 16,color: Colors.black
                                  ),
                                )
                              ]
                          ))

                        /*Text(
                          'Инфраструктура: на территории — уютный ресторан, бар. Частная охраняемая парковка. Бесплатный Wi-Fi.', style: TextStyle(
                          fontSize: 14,
                        ),
                        )*/),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/number.svg',
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          padding: EdgeInsets.only(right: 12),
                          child:

                          RichText(text:TextSpan(

                              children: [
                                TextSpan(
                                  text: 'Номера:',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' 7 номеров уровня Стандарт, Люкс и Делюкс, а также номер с джакузи. вы можете снять номер почасово, на сутки или ночь.',
                                  style: TextStyle(
                                      fontSize: 16,color: Colors.black
                                  ),
                                )
                              ]
                          ))


                        /*Text(
                          'Номера: 13 номеров: несколько стандартах, улучшенные, Delux, лофт. Все оформленных в индивидуальном стиле. Каждый номер укомплектован необходимой мебелью и сантехникой.', style: TextStyle(
                          fontSize: 14,
                        ),
                        )*/),
                    ],
                  ),

                  Padding(
                      padding: EdgeInsets.only(top:24, bottom: 12,left: 12,right: 12),
                      child: button(Palette().red,"Посмотреть номера",Colors.white,13,FontWeight.bold)),
                ],)
            ],
          ),
          Padding(
              padding:
              EdgeInsets.only(left: 12, right: 12,  bottom: 4),
              child: Divider(
                color: Palette().red,
                thickness: 3,
              )),
          ExpansionTile(
            shape: Border(),
            trailing: Icon(Icons.expand_more,size: 40,color:Palette().red ),
            title: Text('Отель на Новокосино',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),),

            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top:24,bottom: 24, left: 12, right: 12),
                    child: Image.asset("assets/3.png"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/loc.svg',
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          padding: EdgeInsets.only(right: 12),
                          child: RichText(text:TextSpan(

                              children: [
                                TextSpan(
                                  text: 'Расположение:',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' гостиница расположена в Восточном административном округе недалеко от станции метро Новокосино. Неподалеку находятся городские зоны отдыха и развлекательные центры.',
                                  style: TextStyle(
                                      fontSize: 16,color: Colors.black
                                  ),
                                )
                              ]
                          ))),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/infr.svg',
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          padding: EdgeInsets.only(right: 12),
                          child:

                          RichText(text:TextSpan(

                              children: [
                                TextSpan(
                                  text: 'Инфраструктура:',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' на территории отеля — охраняемая парковка. В каждом номере – бесплатный Wi-Fi. Поблизости — магазины, рестораны, торговые комплексы.',
                                  style: TextStyle(
                                      fontSize: 16,color: Colors.black
                                  ),
                                )
                              ]
                          ))

                        /*Text(
                          'Инфраструктура: на территории — уютный ресторан, бар. Частная охраняемая парковка. Бесплатный Wi-Fi.', style: TextStyle(
                          fontSize: 14,
                        ),
                        )*/),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/number.svg',
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          padding: EdgeInsets.only(right: 12),
                          child:

                          RichText(text:TextSpan(

                              children: [
                                TextSpan(
                                  text: 'Номера:',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' 9 номеров: стандартные, улучшенные, бизнес Delux и свадебный Delux. Сантехника и мебель новые. Забронировать номер можно на час, сутки или ночь.',
                                  style: TextStyle(
                                      fontSize: 16,color: Colors.black
                                  ),
                                )
                              ]
                          ))


                        /*Text(
                          'Номера: 13 номеров: несколько стандартах, улучшенные, Delux, лофт. Все оформленных в индивидуальном стиле. Каждый номер укомплектован необходимой мебелью и сантехникой.', style: TextStyle(
                          fontSize: 14,
                        ),
                        )*/),
                    ],
                  ),

                  Padding(
                      padding: EdgeInsets.only(top:24, bottom: 12,left: 12,right: 12),
                      child: button(Palette().red,"Посмотреть номера",Colors.white,13,FontWeight.bold)),
                ],)
            ],
          ),
          Padding(
              padding:
              EdgeInsets.only(left: 12, right: 12,  bottom: 4),
              child: Divider(
                color: Palette().red,
                thickness: 3,
              )),
          ExpansionTile(
            shape: Border(),
            trailing: Icon(Icons.expand_more,size: 40,color:Palette().red ),
            title: Text('Отель на Текстильщиках',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),),

            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top:24,bottom: 24, left: 12, right: 12),
                    child: Image.asset("assets/4.png"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/loc.svg',
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          padding: EdgeInsets.only(right: 12),
                          child: RichText(text:TextSpan(

                              children: [
                                TextSpan(
                                  text: 'Расположение:',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' стильный дизайнерский отель на час Текстильщики De Art 13. Расположен рядом со станцией метро на улице Юных Ленинцев в Юго-восточном округе столицы',
                                  style: TextStyle(
                                      fontSize: 16,color: Colors.black
                                  ),
                                )
                              ]
                          ))),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/infr.svg',
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          padding: EdgeInsets.only(right: 12),
                          child:

                          RichText(text:TextSpan(

                              children: [
                                TextSpan(
                                  text: 'Инфраструктура:',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' нашим постояльцам предлагаем охраняемую парковку и бесплатный WI-FI. Недалеко находятся городские зоны отдыха и развлекательные центры.',
                                  style: TextStyle(
                                      fontSize: 16,color: Colors.black
                                  ),
                                )
                              ]
                          ))

                        /*Text(
                          'Инфраструктура: на территории — уютный ресторан, бар. Частная охраняемая парковка. Бесплатный Wi-Fi.', style: TextStyle(
                          fontSize: 14,
                        ),
                        )*/),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/number.svg',
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          padding: EdgeInsets.only(right: 12),
                          child:

                          RichText(text:TextSpan(

                              children: [
                                TextSpan(
                                  text: 'Номера:',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' 10 номеров категорий Улучшенный, Люкс и VIP. Забронировать номер можно на час, сутки или ночь.',
                                  style: TextStyle(
                                      fontSize: 16,color: Colors.black
                                  ),
                                )
                              ]
                          ))


                        /*Text(
                          'Номера: 13 номеров: несколько стандартах, улучшенные, Delux, лофт. Все оформленных в индивидуальном стиле. Каждый номер укомплектован необходимой мебелью и сантехникой.', style: TextStyle(
                          fontSize: 14,
                        ),
                        )*/),
                    ],
                  ),

                  Padding(
                      padding: EdgeInsets.only(top:24, bottom: 12,left: 12,right: 12),
                      child: button(Palette().red,"Посмотреть номера",Colors.white,13,FontWeight.bold)),
                ],)
            ],
          ),
          Padding(
              padding:
              EdgeInsets.only(left: 12, right: 12,  bottom: 4),
              child: Divider(
                color: Palette().red,
                thickness: 3,
              )),

        Align(
            alignment: Alignment.centerLeft,
            child:  Padding(
              padding: EdgeInsets.only(
                top: 24,
                bottom: 12,
                left: 12
              ),
              child: Text(
                'К вашим услугам',
                style: TextStyle(
                    fontSize: 18,
                    color: Palette().red,
                    fontWeight: FontWeight.bold),
              ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        'assets/tv.svg',
                      ),
                      Text('Спутниковое\nтелевидение',
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                      Spacer(
                        flex: 1,
                      ),
                      SvgPicture.asset(
                        'assets/bathrobe.svg',
                      ),
                      Text('Халаты,\nтапочки', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                      Spacer(
                        flex: 1,
                      ),
                      SvgPicture.asset(
                        'assets/cleaning.svg',
                      ),
                      Text('Ежедневная\nуборка',
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                      Spacer(
                        flex: 1,
                      ),
                      SvgPicture.asset(
                        'assets/parking.svg',
                      ),
                      Text('Охраняемая\nпарковка',
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                    ],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        'assets/food.svg',
                      ),
                      Text('Доставка\nеды в номер',
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                      Spacer(
                        flex: 1,
                      ),
                      SvgPicture.asset(
                        'assets/bar.svg',
                      ),
                      Text('Круглосуточный\nбар',
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                      Spacer(
                        flex: 1,
                      ),
                      SvgPicture.asset(
                        'assets/payment.svg',
                      ),
                      Text('Оплата картой\nVisa/Mastercard',
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                      Spacer(
                        flex: 1,
                      ),
                      SvgPicture.asset(
                        'assets/wi-fi.svg',
                      ),
                      Text('Бесплатный\nWi-Fi', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                    ],
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top:24),
            child: Image.asset("assets/hotel2.png"),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child:Padding(
              padding: EdgeInsets.only(
                left:12,
                top: 24,
                bottom: 12,
              ),
              child: Text(
                'Бутик-отель',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

              ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 12),
                  width: MediaQuery.of(context).size.width / 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/Icon_hotels.svg',
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Text('Сеть\nотелей',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      )
                    ],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    'Четыре великолепных бутик-отеля «Де-Арт 13» рассчитаны на небольшое количество постояльцев, которым предлагаются номера с уникальными, продуманными до мелочей интерьерами. Это прекрасная альтернатива крупным столичным гостиницам с типовыми номерами. Здесь можно отдохнуть от суеты большого города, встретиться с друзьями или провести незабываемое романтическое свидание.',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
            ],
          ),
          Padding(
              padding:
                  EdgeInsets.only(left: 12, right: 12, top: 24, bottom: 24),
              child: Divider(
                color: Palette().red,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 12),
                  width: MediaQuery.of(context).size.width / 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/Icon_rooms.svg',
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Text('Номер от\nдизайнеров',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      )
                    ],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    "Номерной фонд отелей включает номера экономкласса, классические стандарты и люксы, свадебный делюкс. В интерьерах используется роскошная мебель с кожаной обивкой и дизайнерские аксессуары, эксклюзивные отделочные материалы. Гостям выдаются уютные халаты, комплекты полотенец и одноразовые тапочки. В каждом номере есть собственная ванна. Номер в бутик-отеле можно снять на час, сутки или несколько дней.",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
            ],
          ),
          Padding(
              padding:
                  EdgeInsets.only(left: 12, right: 12, top: 24, bottom: 24),
              child: Divider(
                color: Palette().red,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 12),
                  width: MediaQuery.of(context).size.width / 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/Icon_interiors.svg',
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Text('Эксклюзивные\nинтерьеры',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      )
                    ],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    'Современная Москва способна удивить даже самого бывалого путешественника. И хотя в мегаполисе снять хороший номер со всеми удобствами просто, отыскать что-то действительно эксклюзивное – задача не из легких. Вместе с тем, даже среди таких немногочисленных вариантов есть особенные, те, которые непременно запомнятся. Именно такими являются отели Де-Арт 13, объединяющие четыре великолепные гостиницы с удобным расположением.',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 24),
            child: Image.asset("assets/Map.png"),
          ),
          Container(
            padding: EdgeInsets.only(top:24, left: 12, right: 12, bottom: 24),
            decoration: BoxDecoration(
              color: Palette().red,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width:MediaQuery.of(context).size.width/2.5,
                        child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'м. Профсоюзная',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Palette().white),
                        ),
                        Text(
                          'ул. Профсоюзная, 64 корп.2',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              color: Palette().white),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '+7 (495) 988 57 94',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Palette().white),
                        ),
                        Text(
                          '+7 (968) 910 37 65',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Palette().white),
                        ),

SizedBox(height: 24,),
                        Text(
                          'м. Новокосино',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Palette().white),
                        ),
                        Text(
                          'ул. Наташи Качуевской,4',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              color: Palette().white),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '+7 (925) 288 33 13',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Palette().white),
                        ),
                        Text(
                          '+7 (499) 178 10 68',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Palette().white),
                        ),
                      ],
                    )),
                    Container(
                        width:MediaQuery.of(context).size.width/2.5,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'м. Таганская',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Palette().white),
                            ),
                            Text(
                              'ул. Народная, дом 14, стр.1 ',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: Palette().white),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              '+7 (495) 798 09 33',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Palette().white),
                            ),
                            Text(
                              '+7 (925) 845 90 33',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Palette().white),
                            ),

                            SizedBox(height: 24,),
                            Text(
                              'м. Текстильщики',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Palette().white),
                            ),
                            Text(
                              'ул. Артюхиной, 14/8, стр.1',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: Palette().white),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              '+7 (925) 562 43 90',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Palette().white),
                            ),
                            Text(
                              '+7 (495) 500 00 77',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Palette().white),
                            ),
                          ],
                        )),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top:24,bottom: 24),
                    child:Divider(color: Colors.white,)),

                SvgPicture.asset(
                  'assets/logo2.svg',
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                Container(
                    width: MediaQuery.of(context).size.width/2.2,
                    height: MediaQuery.of(context).size.height/4,
                    child:  Column(mainAxisAlignment: MainAxisAlignment.spaceAround,

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    TextButton(onPressed: (){},
                        style:TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                        child: Text(
                      "Гостиница Новые Черемушки", style: TextStyle(fontSize: 11,color: Palette().white)
                    )),
                      TextButton(onPressed: (){}, style:TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),child: Text(
                          "Гостиница м.Выхино", style: TextStyle(fontSize: 11,color: Palette().white)
                      )),
                      TextButton(onPressed: (){},style:TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ), child: Text(
                          "Гостиница Академическая", style: TextStyle(fontSize: 11,color: Palette().white)
                      )),
                      TextButton(onPressed: (){}, style:TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),child: Text(
                          "Гостиница Жулебино", style: TextStyle(fontSize: 11,color: Palette().white)
                      )),
                      TextButton(onPressed: (){}, style:TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),child: Text(
                          "Гостиница Новокосино", style: TextStyle(fontSize: 11,color: Palette().white)
                      )),
                      TextButton(onPressed: (){},style:TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ), child: Text(
                          "Гостиница Ленинский проспект", style: TextStyle(fontSize: 11,color: Palette().white)
                      )),
                      TextButton(onPressed: (){}, style:TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),child: Text(
                          "Работа в De Art 13", style: TextStyle(fontSize: 11,color: Palette().white)
                      )),
                  ],)),
                  Container(
                      width: MediaQuery.of(context).size.width/2.2,
                      height: MediaQuery.of(context).size.height/4,
                      child:  Column(

                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        TextButton(onPressed: (){}, style:TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),child: Text(
                            "Гостиница Профсоюзная", style: TextStyle(fontSize: 11,color: Palette().white)
                        )),
                        TextButton(onPressed: (){}, style:TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),child: Text(
                            "Гостиница Калужская", style: TextStyle(fontSize: 11,color: Palette().white)
                        )),
                        TextButton(onPressed: (){}, style:TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),child: Text(
                            "Гостиница Люберцы", style: TextStyle(fontSize: 11,color: Palette().white)
                        )),
                        TextButton(onPressed: (){}, style:TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),child: Text(
                            "Гостиница Беляево", style: TextStyle(fontSize: 11,color: Palette().white)
                        )),
                        TextButton(onPressed: (){},style:TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ), child: Text(
                            "Гостиница Коньково", style: TextStyle(fontSize: 11,color: Palette().white)
                        )),
                        TextButton(onPressed: (){}, style:TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),child: Text(
                            "Номера эконом класса", style: TextStyle(fontSize: 11,color: Palette().white)
                        )),
                        TextButton(onPressed: (){}, style:TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),child: Text(
                            "Отели с почасовой оплатой Москва", style: TextStyle(fontSize: 11,color: Palette().white)
                        )),
                      ],))
                ],),
SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width/2.2,
                        height: MediaQuery.of(context).size.height/4,
                        child:  Column(mainAxisAlignment: MainAxisAlignment.spaceAround,

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(onPressed: (){},
                                style:TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                    "Отзывы", style: TextStyle(fontSize: 11,color: Palette().white)
                                )),
                            TextButton(onPressed: (){}, style:TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),child: Text(
                                "Номер с джакузи", style: TextStyle(fontSize: 11,color: Palette().white)
                            )),
                            TextButton(onPressed: (){},style:TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ), child: Text(
                                "Отель метро Люблино", style: TextStyle(fontSize: 11,color: Palette().white)
                            )),
                            TextButton(onPressed: (){}, style:TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),child: Text(
                                "Свадебный номер", style: TextStyle(fontSize: 11,color: Palette().white)
                            )),
                            TextButton(onPressed: (){}, style:TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),child: Text(
                                "Гостиница на ночь", style: TextStyle(fontSize: 11,color: Palette().white)
                            )),
                            TextButton(onPressed: (){},style:TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ), child: Text(
                                "Гостиница метро Печатники", style: TextStyle(fontSize: 11,color: Palette().white)
                            )),
                            TextButton(onPressed: (){}, style:TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),child: Text(
                                "Карта сайта", style: TextStyle(fontSize: 11,color: Palette().white)
                            )),
                          ],)),
                    Container(
                        width: MediaQuery.of(context).size.width/2.2,
                        height: MediaQuery.of(context).size.height/4,
                        child:  Column(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(onPressed: (){}, style:TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),child: Text(
                                "О нас ", style: TextStyle(fontSize: 11,color: Palette().white)
                            )),
                            TextButton(onPressed: (){}, style:TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),child: Text(
                                "Контакты", style: TextStyle(fontSize: 11,color: Palette().white)
                            )),
                            TextButton(onPressed: (){}, style:TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),child: Text(
                                "Общие положения", style: TextStyle(fontSize: 11,color: Palette().white)
                            )),
                            TextButton(onPressed: (){}, style:TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),child: Text(
                                "Правила проживания", style: TextStyle(fontSize: 11,color: Palette().white)
                            )),
                            TextButton(onPressed: (){},style:TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ), child: Text(
                                "Дополнительные услуги", style: TextStyle(fontSize: 11,color: Palette().white)
                            )),
                            TextButton(onPressed: (){}, style:TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),child: Text(
                                "Прайс-лист", style: TextStyle(fontSize: 11,color: Palette().white)
                            )),
                            TextButton(onPressed: (){}, style:TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),child: Text(
                                "Обработка персональных данных", style: TextStyle(fontSize: 11,color: Palette().white)
                            )),
                          ],))
                  ],),
                SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(flex:3),
                    SvgPicture.asset(
                      'assets/wa.svg',
                    ),
                    Spacer(flex:1),
                    SvgPicture.asset(
                      'assets/tg.svg',
                    ),
                    Spacer(flex:1),
                    SvgPicture.asset(
                      'assets/viber.svg',
                    ),
                    Spacer(flex:1),
                    SvgPicture.asset(
                      'assets/vk.svg',
                    ),
                    Spacer(flex:3),
                  ],
                ),
                SizedBox(height: 24,),

                Text("© 2023 De Art 13", style: TextStyle(fontSize:11 , color: Colors.white),),
                SizedBox(height: 12,),
                Text("Информационные материалы, размещенные на сайте, носят справочный характер и не являются публичной офертой", style: TextStyle(fontSize:11 , color: Colors.white),textAlign: TextAlign.center,)
              ],
            ),
          )
        ],
      ))),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
