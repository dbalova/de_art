import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../palette.dart';

class CreateReviewsPage extends StatefulWidget {
  const CreateReviewsPage({Key? key}) : super(key: key);

  @override
  State<CreateReviewsPage> createState() => _CreateReviewsPageState();
}
String selectedValue ="Профсоюзная" ;
//String? selectedValue ;
List<String>_hotel=["Профсоюзная","Таганская","Новокосино","Текстильщики"];
int stars=0;
bool _agree = false;
class _CreateReviewsPageState extends State<CreateReviewsPage> {
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
                DropdownButton<String>(
                  // Step 3.
                  value: selectedValue,
                  // Step 4.
                  items: <String>["Профсоюзная","Таганская","Новокосино","Текстильщики"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 30),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                ),



                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Ваше имя",style: TextStyle(fontWeight: FontWeight.bold)),),
                Container(
                  padding: EdgeInsets.only(left:12),
                  margin: EdgeInsets.only(bottom: 12),
                  width: MediaQuery.of(context).size.width/1.5,
                  child: TextField(   decoration: const InputDecoration(
                    hintText: "Иван Иванович",
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

             Padding(
                 padding: EdgeInsets.only(top:12,bottom: 12),
                 child:   Align(
                  alignment: Alignment.center,
                  child: Text("Оцените это место",style: TextStyle(fontWeight: FontWeight.bold)),)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                 GestureDetector(
                     onTap:(){

                       stars=1;
                       setState(() {

                       });

                     },

                     child: stars>=1 ? Container(
                         height: 40,
                         width: 40,
                         child:SvgPicture.asset(
                           'assets/goldStar.svg',
                         )): Container(
                         height: 40,
                         width: 40,
                         child:SvgPicture.asset(
                           'assets/greyStar.svg',
                         ))),

                  GestureDetector(
                      onTap:(){

                        stars=2;
                        setState(() {

                        });

                      },

                      child: stars>=2 ? Container(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                            'assets/goldStar.svg',
                          )): Container(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                            'assets/greyStar.svg',
                          ))),
                  GestureDetector(
                      onTap:(){

                        stars=3;
                        setState(() {

                        });

                      },

                      child: stars>=3 ? Container(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                            'assets/goldStar.svg',
                          )): Container(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                            'assets/greyStar.svg',
                          ))),
                  GestureDetector(
                      onTap:(){

                        stars=4;
                        setState(() {

                        });

                      },

                      child: stars>=4 ? Container(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                            'assets/goldStar.svg',
                          )): Container(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                            'assets/greyStar.svg',
                          ))),
                  GestureDetector(
                      onTap:(){

                        stars=5;
                        setState(() {

                        });

                      },

                      child: stars>=5 ? Container(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                        'assets/goldStar.svg',
                      )): Container(
                          height: 40,
                          width: 40,
                          child:SvgPicture.asset(
                            'assets/greyStar.svg',
                          ))),
                 /* SvgPicture.asset(
                    'assets/greyStar.svg',
                  ),
                  SvgPicture.asset(
                    'assets/greyStar.svg',
                  ),
                  SvgPicture.asset(
                    'assets/greyStar.svg',
                  ),
                  SvgPicture.asset(
                    'assets/greyStar.svg',
                  )*/


                ],),

                Container(
                  margin: EdgeInsets.only(top:24),
                  padding: EdgeInsets.only(left:12),
                  width: MediaQuery.of(context).size.width/1.5,
                  height:MediaQuery.of(context).size.height/5,
                  child: TextField(

                    maxLines: 5,
                    decoration: const InputDecoration(
                    hintText: "Текст отзыва",
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
                  child: Text("Оставить отзыв", style: TextStyle(color: Colors.white,fontSize: 16 , fontWeight:FontWeight.bold, ),textAlign: TextAlign.center,),

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
