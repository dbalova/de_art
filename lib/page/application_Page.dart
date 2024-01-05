import 'package:de_art/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}
bool _agree = false;
class _ApplicationPageState extends State<ApplicationPage> {
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
                  child:Icon(Icons.cancel_outlined,size: 48,color: Colors.white,))),
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
                  alignment: Alignment.centerLeft,
                  child: Text("Ваше имя",style: TextStyle(fontWeight: FontWeight.bold)),),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  width: MediaQuery.of(context).size.width/1.5,
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
                  width: MediaQuery.of(context).size.width/1.5,
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
                  width: MediaQuery.of(context).size.width/1.5,
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

                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Icon(Icons.call,size: 16,),
                      ),
                      Container(

                          child: Text(
                            "+7(925)-288-33-13",
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 13),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0,left: 4),
                        child: Icon(Icons.call,size: 16,),
                      ),
                      Container(

                          child: Text(
                            "+7(499)-178-10-68",
                            overflow: TextOverflow.clip,
                            style: TextStyle(fontSize: 13),
                          )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [SvgPicture.asset(
                    'assets/redTg.svg',
                  ),
                    SvgPicture.asset(
                      'assets/redVk.svg',
                    ),
                    SvgPicture.asset(
                      'assets/redViber.svg',
                    ),
                    SvgPicture.asset(
                      'assets/redWa.svg',
                    ),



                  ],)



              ],
            ),
          )
        ],
      ),),
    );
  }
}
