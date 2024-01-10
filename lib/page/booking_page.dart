import 'package:de_art/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}
int counter=1;
int duration=1;
int people=1;
bool _agree = false;
class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.65),
      body: SingleChildScrollView(child: Column(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child:Padding(
                  padding: EdgeInsets.only(right: 30,top:48),
                  child:GestureDetector(
                      onTap: (){Navigator.pop(context);},
                      child:Icon(Icons.cancel_outlined,size: 48,color: Colors.white,)))),
          Container(
            padding: EdgeInsets.only(top:24,bottom: 24,right: 24,left:24 ),
            margin: EdgeInsets.only(top:12,bottom: 12,right: 24,left:24 ),
            decoration: BoxDecoration(
              color: Colors.white
            ),
            width: MediaQuery.of(context).size.width-60,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "211 Лофт с джакузи",
                    style: TextStyle(
                        fontSize: 30,
                        color: Palette().red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0,bottom: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            duration=1;
                            setState(() {

                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/5,
                            child: Text(
                              "На час", style: TextStyle(fontSize: 16,
                                fontWeight: duration == 1
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.black),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: (){
                            duration=2;
                            setState(() {

                            });
                          },
                          child: Container( width: MediaQuery.of(context).size.width/5,
                            child: Text(
                              "На ночь", style: TextStyle(fontSize: 16,
                                fontWeight: duration == 2
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.black),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: (){
                            duration=3;
                            setState(() {

                            });
                          },
                          child: Container( width: MediaQuery.of(context).size.width/5,
                            child: Text(
                              "На сутки", style: TextStyle(fontSize: 16,
                                fontWeight: duration == 3
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.black),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Дата заезда",style: TextStyle(fontWeight: FontWeight.bold)),),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                 // width: MediaQuery.of(context).size.width/1.5,
                  child: TextField(   decoration: const InputDecoration(
                    hintText: "  дд.мм.гггг",
                    isDense: true,
                    border: InputBorder.none, ),),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Colors.black),
                      top: BorderSide(
                          width: 1.0, color: Colors.black),
                      left: BorderSide(
                          width: 1.0, color: Colors.black),
                      right: BorderSide(
                          width: 1.0, color: Colors.black),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Время заезда",style: TextStyle(fontWeight: FontWeight.bold)),),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                 // width: MediaQuery.of(context).size.width/1.5,
                  child: TextField(   decoration: const InputDecoration(
                    hintText: "  Выберите время",
                    isDense: true,
                    border: InputBorder.none, ),),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Colors.black),
                      top: BorderSide(
                          width: 1.0, color: Colors.black),
                      left: BorderSide(
                          width: 1.0, color: Colors.black),
                      right: BorderSide(
                          width: 1.0, color: Colors.black),
                    ),
                  ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Text("Часов", style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                 GestureDetector(
                     onTap: (){
                       counter--;
                       setState(() {

                       });
                     },
                     child: SvgPicture.asset(
                    'assets/Minus.svg',
                  )),
                  Text(counter.toString(), style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                 GestureDetector(
                     onTap: (){
                       counter--;
                       setState(() {

                       });
                     },
                     child: SvgPicture.asset(
                    'assets/Plus.svg',
                  )),
                  Text("4 500 ₽", style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                ],),

                Padding(
                  padding: const EdgeInsets.only(top: 24.0,bottom: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            people=1;
                            setState(() {

                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/3.5,
                            child: Text(
                              "1 взрослый", style: TextStyle(fontSize: 16,
                                fontWeight: people == 1
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.black),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: (){
                            people=2;
                            setState(() {

                            });
                          },
                          child: Container( width: MediaQuery.of(context).size.width/3.5,
                            child: Text(
                              "2 взрослых", style: TextStyle(fontSize: 16,
                                fontWeight: people == 2
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.black),
                              ),
                            ),
                          )),

                    ],
                  ),
                ),


                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Ваше имя",style: TextStyle(fontWeight: FontWeight.bold)),),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                 // width: MediaQuery.of(context).size.width/1.5,
                  child: TextField(   decoration: const InputDecoration(
                    hintText: "  Иван Иванович",
                    isDense: true,
                    border: InputBorder.none, ),),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Colors.black),
                      top: BorderSide(
                          width: 1.0, color: Colors.black),
                      left: BorderSide(
                          width: 1.0, color: Colors.black),
                      right: BorderSide(
                          width: 1.0, color: Colors.black),
                    ),
                  ),
                ),
               Align(
                 alignment: Alignment.centerLeft,
                 child: Text("Номер телефона",style: TextStyle(fontWeight: FontWeight.bold)),),
                Container(
               //   width: MediaQuery.of(context).size.width/1.5,
                  child: TextField(   decoration: const InputDecoration(
                    hintText: "  +7 (999) 999 99 99",
                    isDense: true,
                    border: InputBorder.none, ),),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Colors.black),
                      top: BorderSide(
                          width: 1.0, color: Colors.black),
                      left: BorderSide(
                          width: 1.0, color: Colors.black),
                      right: BorderSide(
                          width: 1.0, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:24),
               //   width: MediaQuery.of(context).size.width/1.5,
                  height:MediaQuery.of(context).size.height/5,
                  child: TextField(   decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none, ),),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Colors.black),
                      top: BorderSide(
                          width: 1.0, color: Colors.black),
                      left: BorderSide(
                          width: 1.0, color: Colors.black),
                      right: BorderSide(
                          width: 1.0, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  margin: EdgeInsets.only(top: 15, bottom: 15,),
                  padding: EdgeInsets.only(top: 15, bottom: 15,left: 24,right: 24),
                  decoration: BoxDecoration(
                    color: Palette().red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("Оставить заявку", style: TextStyle(color: Colors.white,fontSize: 16 , fontWeight:FontWeight.bold, ),textAlign: TextAlign.center,),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 GestureDetector(
                     onTap:(){_agree=!_agree;
                       setState(() {

                       });},
                     child:_agree?SvgPicture.asset(
                       'assets/agree.svg',
                     ): SvgPicture.asset(
                    'assets/disagree.svg',
                  )),
                 Container(
                     width: MediaQuery.of(context).size.width/1.7,
                     child: RichText(
                      text: TextSpan(children: [

                        TextSpan(
                          text:
                          'Я согласен ',
                          style:
                          TextStyle(fontSize: 13, color: Colors.black),
                        ),
                        TextSpan(
                          text:
                          'политикой конфиденциальности и обработки персональных данных',
                          style:
                          TextStyle(fontSize: 13, color: Colors.black,decoration: TextDecoration.underline),
                        )
                      ]))),


                ],),





              ],
            ),
          )
        ],
      ),),
    );
  }
}
