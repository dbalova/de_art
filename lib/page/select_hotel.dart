import 'package:de_art/page/reviews_page.dart';
import 'package:de_art/page/room_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../custom_widget/buttonModel.dart';
import '../custom_widget/footer.dart';
import '../main.dart';
import '../palette.dart';
import 'menu_page.dart';

class SelectHotelPage extends StatefulWidget {
  const SelectHotelPage({Key? key}) : super(key: key);

  @override
  State<SelectHotelPage> createState() => _SelectHotelPageState();
}


bool _isJacuzzi = false;
bool _isParking = false;
bool _price550 = false;
bool _price750 = false;
bool _price1100 = false;

List<Image> fotoRoom = [
  Image.asset("assets/sea.png"),
  Image.asset("assets/1.png"),
  Image.asset("assets/2.png"),
  Image.asset("assets/3.png"),
];

class _SelectHotelPageState extends State<SelectHotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(78.0),
            child: AppBar(
              backgroundColor: Colors.white,
              leading: GestureDetector(
                  onTap: (){  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const MenuPage(),
                    ),
                  );},
                  child: Container(
                  margin: EdgeInsets.only(left: 12, top: 12),
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
                Container(
                    height: 62,
                    margin: EdgeInsets.only(right: 12, top: 12),
                    child: SvgPicture.asset(
                      'assets/call.svg',
                    ))
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
                        "De Art 13 отель на Таганской",
                        style: TextStyle(
                            fontSize: 30,
                            color: Palette().red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 28.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.place),
                          ),
                          Text("Москва, ул. Народная, дом 14, стр.1")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 24),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.call),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: Text(
                                "+7(929)-562-43-90      +7(499)-178-10-68",
                                overflow: TextOverflow.clip,
                              ))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                     GestureDetector(
                         onTap: (){
                           showDialog(context: context, builder: (BuildContext context){
                              return  Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.cancel_outlined,color: Colors.white,size: 48,)),
                                  AlertDialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(0))
                                    ),
                                      title: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Как добраться:",
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Palette().red,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                      content: Container(

                                        height: MediaQuery.of(context)
                                            .size
                                            .height/2,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset('assets/taganskaya.png'),
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.only(
                                                    top: 24, bottom: 24),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                  //Доехать до отеля De art Art 13 можно с помощью метро Таганская и далее пешком 4 минуты (340 метров).
                                                  TextSpan(
                                                    text:
                                                        'Доехать до отеля De art Art 13 можно с помощью ',
                                                    style: TextStyle(
                                                      fontFamily: "CeraPro",
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'метро Таганская и далее пешком 4 минуты ',
                                                    style: TextStyle(
                                                        fontFamily: "CeraPro",
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  TextSpan(
                                                    text: '(340 метров)',
                                                    style: TextStyle(
                                                        fontFamily: "CeraPro",
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  )
                                                ]))),
                                            Text("От метро нужно сначала повернуть налево и пройти вдоль дома №7, далее перейти по пешеходному переходу на другую сторону, повернуть налево и пройти прямо вдоль дома №8."),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              );
                              });
                            },
                         child:   Container(
                          margin: EdgeInsets.only(right: 24, bottom: 24),
                          child: Text(
                            "Как добраться",
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                        )),
                        GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (BuildContext context){
                                return  Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.cancel_outlined,color: Colors.white,size: 48,)),
                                    AlertDialog(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(0))
                                      ),
                                      title: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "К вашим услугам",
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Palette().red,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                      content: Container(
margin:EdgeInsets.only(top:24),
                                        height: MediaQuery.of(context)
                                            .size
                                            .height/2,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                        style: TextStyle(
                                                            fontSize: 14, fontWeight: FontWeight.bold)),
                                                    Spacer(
                                                      flex: 1,
                                                    ),
                                                    SvgPicture.asset(
                                                      'assets/bathrobe.svg',
                                                    ),
                                                    Text('Халаты,\nтапочки',
                                                        style: TextStyle(
                                                            fontSize: 14, fontWeight: FontWeight.bold)),
                                                    Spacer(
                                                      flex: 1,
                                                    ),
                                                    SvgPicture.asset(
                                                      'assets/cleaning.svg',
                                                    ),
                                                    Text('Ежедневная\nуборка',
                                                        style: TextStyle(
                                                            fontSize: 14, fontWeight: FontWeight.bold)),
                                                    Spacer(
                                                      flex: 1,
                                                    ),
                                                    SvgPicture.asset(
                                                      'assets/parking.svg',
                                                    ),
                                                    Text('Охраняемая\nпарковка',
                                                        style: TextStyle(
                                                            fontSize: 14, fontWeight: FontWeight.bold)),
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
                                                        style: TextStyle(
                                                            fontSize: 14, fontWeight: FontWeight.bold)),
                                                    Spacer(
                                                      flex: 1,
                                                    ),
                                                    SvgPicture.asset(
                                                      'assets/bar.svg',
                                                    ),
                                                    Text('Круглосуточный\nбар',
                                                        style: TextStyle(
                                                            fontSize: 14, fontWeight: FontWeight.bold)),
                                                    Spacer(
                                                      flex: 1,
                                                    ),
                                                    SvgPicture.asset(
                                                      'assets/payment.svg',
                                                    ),
                                                    Text('Оплата картой\nVisa/Mastercard',
                                                        style: TextStyle(
                                                            fontSize: 14, fontWeight: FontWeight.bold)),
                                                    Spacer(
                                                      flex: 1,
                                                    ),
                                                    SvgPicture.asset(
                                                      'assets/wi-fi.svg',
                                                    ),
                                                    Text('Бесплатный\nWi-Fi',
                                                        style: TextStyle(
                                                            fontSize: 14, fontWeight: FontWeight.bold)),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                            },
                            child:Container(
                          margin: EdgeInsets.only( bottom: 24),
                          child: Text(
                            "Услуги",
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                          ),
                        )),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       GestureDetector(
                           onTap: (){
                             _isJacuzzi=!_isJacuzzi;
                             setState(() {

                             });
                           },
                           child: Container(
                          margin: EdgeInsets.only(
                            right: 8,
                          ),
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 12, right: 12),
                          decoration: BoxDecoration(
                            color: _isJacuzzi?Palette().red:Colors.white,

                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            border: Border.all(
                              width: 1,
                              color: _isJacuzzi? Colors.transparent:Colors.black,
                            ),
                          ),
                          child: Text("С джакузи",style: TextStyle(color: _isJacuzzi? Colors.white:Colors.black,),),
                        )),
                       GestureDetector(
                           onTap: (){
                             _isParking=!_isParking;
                             setState(() {

                             });
                           },

                           child: Container(
                          margin: EdgeInsets.only(
                            right: 8,
                          ),
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 12, right: 12),
                          decoration: BoxDecoration(
                            color: _isParking?Palette().red:Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            border: Border.all(
                              width: 1,
                              color: _isParking? Colors.transparent:Colors.black,
                            ),
                          ),
                          child: Text("С парковкой",style: TextStyle(color: _isParking? Colors.white:Colors.black,),),
                        )),
                       GestureDetector(
                           onTap: (){
                             _price550=!_price550;
                             setState(() {

                             });
                           },
                           child: Container(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 12, right: 12),
                          decoration: BoxDecoration(
                            color: _price550?Palette().red:Colors.white,

                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            border: Border.all(
                              width: 1,
                              color: _price550? Colors.transparent:Colors.black,
                            ),
                          ),
                          child: Text("До 550 в час",style: TextStyle(color: _price550? Colors.white:Colors.black,),),
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: (){
                              _price750=!_price750;
                              setState(() {

                              });

                            },
                            child:Container(
                          margin: EdgeInsets.only(right: 8, top: 12),
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 12, right: 12),
                          decoration: BoxDecoration(
                            color: _price750?Palette().red:Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            border: Border.all(
                              width: 1,
                              color: _price750? Colors.transparent:Colors.black,
                            ),
                          ),
                          child: Text("До 750 в час",style: TextStyle(color: _price750? Colors.white:Colors.black,),),
                        )),
                        GestureDetector(
                            onTap: (){
                              _price1100=!_price1100;
                              setState(() {

                              });
                            },
                            child:Container(
                          margin: EdgeInsets.only(
                            top: 12,
                          ),
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 12, right: 12),
                          decoration: BoxDecoration(
                            color: _price1100?Palette().red:Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            border: Border.all(
                              width: 1,color: _price1100? Colors.transparent:Colors.black,
                            ),
                          ),
                          child: Text("До 1 100 в час",style: TextStyle(color: _price1100? Colors.white:Colors.black,),),
                        )),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 12),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(245, 245, 245, 1)),
                      child: Column(
                        children: [
                          Container(
                              height: 265,
                              child: Swiper(
                                itemBuilder: (context, index) {
                                  return fotoRoom[index];
                                },
                                itemCount: fotoRoom.length,
                                //pagination: const SwiperPagination(),
                                control: const SwiperControl(
                                    color: Colors.white,
                                    iconNext: Icons.arrow_circle_right_outlined,
                                    iconPrevious:
                                        Icons.arrow_circle_left_outlined),
                              )),
                          Container(
                              padding: EdgeInsets.only(top: 12, bottom: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 12, right: 12),
                                      child: Text(
                                        '209 Cтандарт Морской с джакузи',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 12,
                                          top: 12,
                                          left: 12,
                                          right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    '750 ₽',
                                                    style:
                                                        TextStyle(fontSize: 15),
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    '3 500 ₽',
                                                    style:
                                                        TextStyle(fontSize: 15),
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    '4 500 ₽',
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ))
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 12,
                                          top: 12,
                                          left: 12,
                                          right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/mark.svg',
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            'Профсоюзная',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Spacer(
                                            flex: 2,
                                          ),
                                         GestureDetector(
                                             onTap: (){
                                               Navigator.push(
                                                 context,
                                                 MaterialPageRoute(
                                                   builder: (BuildContext context) => const RoomPage(),
                                                 ),
                                               );
                                             },
                                             child: Text(
                                            'Подробнее',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationThickness: 2,
                                                fontSize: 18),
                                          )),
                                        ],
                                      )),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 12, right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/stars.svg',
                                          ),
                                          RedButton(
                                              Palette().red,
                                              "Бронировать",
                                              Palette().white,
                                              15,
                                              FontWeight.normal),
                                        ],
                                      )),
                                ],
                              ))
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: 12, top: 12, left: 12, right: 12),
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
                          GestureDetector(

                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => const ReviewsPage(),
                                ),
                              );
                            },

                              child:  Text(
                              'Смотреть все отзывы',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                  fontSize: 18),
                            )),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
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
                                fontSize: 13,
                                color: Color.fromRGBO(74, 74, 74, 1)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(flex: 3),
                        SvgPicture.asset(
                          'assets/left.svg',
                        ),
                        Spacer(flex: 1),
                        SvgPicture.asset(
                          'assets/right.svg',
                        ),
                        Spacer(flex: 3),
                      ],
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Об отеле',
                          style: TextStyle(
                              fontSize: 20,
                              color: Palette().red,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 12,
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
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Расположение:',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text:
                                    ' De art Art 13 находится по адресу: улица Народная, дом 14, строение 1.',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              )
                            ]))),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/metro.svg',
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            padding: EdgeInsets.only(right: 12),
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Рядом есть',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              TextSpan(
                                text: ' станция метро Таганская,',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text:
                                    ' от которой можно быстро добраться до отеля (340 метров - 4 минуты пешком).',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              )
                            ]))),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24, bottom: 12),
                      child: Text(
                          "Эстетика классики и комфорт современности сплелись воедино в нашем отеле De art Art 13. Никто не останется равнодушным, если проведет здесь хотя бы одну ночь. Для наших гостей доступны стильные номера со всем необходимым: телевизор, белоснежные кровати, мини-бар, кондиционер, включенный в оплату завтрак, ванна и самое главное — отличный сервис."),
                    ),
                    Text(
                        'Забронировать номер в отеле можно на сутки, на ночь или почасово. Это очень удобно и востребовано для всех посетителей. Также в нашем отеле есть ночной бар, в котором можно провести время ярко и незабываемо.'),
                    Padding(
                        padding: EdgeInsets.only(top: 64, bottom: 16),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Преимущества',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Palette().red,
                                  fontWeight: FontWeight.bold),
                            ))),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/Icon_sofa.svg',
                                ),
                                Text(
                                    'Уютные номера,\nоснащенные\nсовременной мебелью\nи техникой',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/metro.svg',
                                ),
                                Text('Близкое\nрасположение к метро',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/Icon_interiors.svg',
                                ),
                                Text('Дизайнерский\nинтерьер номеров',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/iconFood.svg',
                                ),
                                Text('Прекрасный сервис',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/Icon_jakuzi.svg',
                                ),
                                Text('Романтические\nномера с джакузи',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/food.svg',
                                ),
                                Text('Доставка завтрака\nв номер',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/Icon_Tretyakovka.svg',
                                ),
                                Text(
                                    'Исторические\nдостопримечательно\nсти рядом с отелем',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/payment.svg',
                                ),
                                Text(
                                    'Возможность\nпочасовой\nи посуточной оплаты,\nа также оплаты за ночь',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold))
                              ],
                            )),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 64, bottom: 16),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Для кого подойдет',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Palette().red,
                                  fontWeight: FontWeight.bold),
                            ))),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/Icon_molodozheni.svg',
                                ),
                                Text('Для молодоженов\nи семейных пар',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/icon_svidanie.svg',
                                ),
                                Text('Для романтических\nсвиданий',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold))
                              ],
                            )),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 24, bottom: 60),
                        child: Text(
                            "Наш отель подойдет для молодоженов, семейных пар и туристов. Ведь рядом находятся всем известные Третьяковская галерея, Театр Русской драмы и Котельническая набережная, а также рестораны и кафе, в которых можно вкусно пообедать или поужинать. Кроме того, наш отель подойдет для людей, ценящих комфорт и свое время, приезжающих в Москву для деловых встреч и по работе.")),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8, right: 8),
                          child: Image.asset("assets/Rectangle1.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8, left: 8),
                          child: Image.asset("assets/Rectangle2.png"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 8, right: 8),
                          child: Image.asset("assets/Rectangle3.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8, left: 8),
                          child: Image.asset("assets/Rectangle4.png"),
                        ),
                      ],
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding:
                                EdgeInsets.only(top: 24, bottom: 12,),
                            child: Text(
                              'Достопримечательности рядом с отелем',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ))),
                    Padding(
                      padding:
                      EdgeInsets.only( bottom: 24, ),
                      child:Text(
                        "Отель De art расположен рядом с красивейшими достопримечательностями, кафе и магазинам, а также другими объектами:"),
                    ),Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" • "),
                        Container(width: MediaQuery.of(context).size.width-50,child: Text(" Третьяковская галерея;"))
                      ],
                    ),
                    Row(  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" • "),
                        Container(width: MediaQuery.of(context).size.width-50,
                            child: Text(
                                " Котельническая и Краснохолмская набережные;"))
                      ],
                    ),
                    Row(  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" • "),
                        Container(width: MediaQuery.of(context).size.width-50,child: Text(" Театр русской драмы;"))
                      ],
                    ),
                    Row(  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" • "),
                        Container(width: MediaQuery.of(context).size.width-50,child: Text(" Студия красоты Fantasy;"))
                      ],
                    ),
                    Row(  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" • "),
                        Container(width: MediaQuery.of(context).size.width-50,
                            child: Text(" Магазин нижнего белья Crazy Beach;"))
                      ],
                    ),
                    Row(  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" • "),
                        Container(width: MediaQuery.of(context).size.width-50,child: Text(" Магазин Красное и белое;"))
                      ],
                    ),
                    Row(  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" • "),
                        Container(
                          width: MediaQuery.of(context).size.width-50,
                            child: Text(
                          " Пабы, закусочные, пекарни, кафе и бары с разным ценовым сегментом на любой вкус.",
                          style: TextStyle(overflow: TextOverflow.clip),
                        ))
                      ],
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(top: 24, ),
                      child:Text(
                        "Если вы любите искусство, шоппинг, вкусную еду и приятное времяпровождение, добраться до этих мест от нашей гостиницы вы можете даже пешком."),),

                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(top: 24, bottom: 12, ),
                            child: Text(
                              'Как доехать до отеля',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Palette().red,
                                  fontWeight: FontWeight.bold),
                            ))),
                    Image.asset('assets/taganskaya.png'),
                    Container(
                        width: MediaQuery.of(context).size.width ,
                        padding: EdgeInsets.only(top:24,bottom: 24),
                        child: RichText(
                            text: TextSpan(children: [
                              //Доехать до отеля De art Art 13 можно с помощью метро Таганская и далее пешком 4 минуты (340 метров).
                              TextSpan(
                                text:
                                'Доехать до отеля De art Art 13 можно с помощью ',
                                style:
                                TextStyle(fontSize: 14, color: Colors.black),
                              ),
                              TextSpan(
                                text: 'метро Таганская и далее пешком 4 минуты ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text:
                                '(340 метров)',
                                style:
                                TextStyle(fontSize: 14, color: Colors.black),
                              )
                            ]))),

                    Text("От метро нужно сначала повернуть налево и пройти вдоль дома №7, далее перейти по пешеходному переходу на другую сторону, повернуть налево и пройти прямо вдоль дома №8."),



                  ],
                )),
            Container(
              padding: const EdgeInsets.only(top: 24),
              child: Image.asset('assets/Map.png'),
            ),
            Footer(context)
          ],
        )));
  }
}
