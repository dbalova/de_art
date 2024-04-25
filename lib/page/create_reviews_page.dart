import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../palette.dart';
import '../service/api.dart';

class CreateReviewsPage extends StatefulWidget {
  const CreateReviewsPage({Key? key}) : super(key: key);

  @override
  State<CreateReviewsPage> createState() => _CreateReviewsPageState();
}
String selectedValue ="Профсоюзная" ;
//String? selectedValue ;
bool _showHotel=false;
TextEditingController _nameController=TextEditingController();
TextEditingController _reviewController=TextEditingController();
Color dropColor = Colors.black;
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
         Container(
             padding: EdgeInsets.only(left:12,right: 12,bottom: 12,top:12),
             margin: EdgeInsets.only(bottom: 12,top: 32),
             width: MediaQuery.of(context).size.width/1.5,
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
             child:      Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   selectedValue,
                   style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                 ),
                 Container(
                     width: 20,
                     child:
                   GestureDetector(child:Icon(Icons.keyboard_arrow_down),onTap: (){
                     _showHotel=!_showHotel;
                     setState(() {

                     });
                   },)

                   /*DropdownButton<String>(
                   padding: EdgeInsets.zero,
                   style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                   dropdownColor: Palette().red,
                      focusColor: Colors.green,
                      // Step 3.
                      value: selectedValue,
                      // Step 4.
                      items: <String>["Профсоюзная","Таганская","Новокосино","Текстильщики"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                          ),
                        );
                      }).toList(),
                      // Step 5.
                      onChanged: (String? newValue) {
                        setState(() {

                          selectedValue = newValue!;
                        });
                      },
                    )*/),
               ],
             )),

                _showHotel?   Container(
                  margin: EdgeInsets.only(bottom: 12),
                 width: MediaQuery.of(context).size.width/1.5,
                  decoration: BoxDecoration(
                    color: Palette().red,

                  ),
                  child: Column(
                    children: [
                      TextButton(onPressed: (){
                        selectedValue="Профсоюзная";
                        setState(() {

                        });

                      }, child:Text(
                        "Профсоюзная",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                      ),),
                      TextButton(onPressed: (){
                        selectedValue="Таганская";
                        setState(() {

                        });

                      }, child:Text(
                        "Таганская",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                      ),),
                      TextButton(onPressed: (){
                        selectedValue="Новокосино";
                        setState(() {

                        });

                      }, child:Text(
                        "Новокосино",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                      ),),
                      TextButton(onPressed: (){
                        selectedValue="Текстильщики";
                        setState(() {

                        });

                      }, child:Text(
                        "Текстильщики",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                      ),),
                    ],
                  ),

                ):Container(),



                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("  Ваше имя",style: TextStyle(fontWeight: FontWeight.bold)),),
                SizedBox(height: 6,),
                Container(
                  padding: EdgeInsets.only(left:12),
                  margin: EdgeInsets.only(bottom: 12),
                  width: MediaQuery.of(context).size.width/1.5,
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
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
controller: _reviewController ,
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
               GestureDetector(
                   onTap: () async {
                     if (_agree!=true){
                       Fluttertoast.showToast(
                           msg: "Подтвердите согласие!",
                           toastLength:
                           Toast.LENGTH_SHORT,
                           gravity:
                           ToastGravity.CENTER,
                           timeInSecForIosWeb: 1,
                           backgroundColor:
                           Colors.red,
                           textColor: Colors.white,
                           fontSize: 16.0);
                     }else {
                       if((_nameController.text!="")&(_reviewController.text!=""))
                       {
                         String idSelectelHotel = "1";
if(    selectedValue=="Профсоюзная"){idSelectelHotel = "1";}
else if(   selectedValue=="Таганская"){idSelectelHotel = "4";}
else if(selectedValue=="Новокосино"){idSelectelHotel = "2";}
else if ( selectedValue=="Текстильщики"){idSelectelHotel = "5";}
                       var _res=  await leave_review(idSelectelHotel.toString(),_nameController.text.toString(), _reviewController.text.toString());
if (_res=="success"){Fluttertoast.showToast(
    msg: "Отзыв успешно отправлен!",
    toastLength:
    Toast.LENGTH_SHORT,
    gravity:
    ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor:
    Colors.red,
    textColor: Colors.white,
    fontSize: 16.0);
Navigator.pop(context);}else {Fluttertoast.showToast(
    msg: "Отзыв не отправлен!",
    toastLength:
    Toast.LENGTH_SHORT,
    gravity:
    ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor:
    Colors.red,
    textColor: Colors.white,
    fontSize: 16.0);
Navigator.pop(context);}
                       }else{

                         Fluttertoast.showToast(
                             msg: "Заполните данные!",
                             toastLength:
                             Toast.LENGTH_SHORT,
                             gravity:
                             ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                             backgroundColor:
                             Colors.red,
                             textColor: Colors.white,
                             fontSize: 16.0);
                       }
                     }
                   },
                   child: Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  margin: EdgeInsets.only(top: 15, bottom: 15,),
                  padding: EdgeInsets.only(top: 15, bottom: 15,left: 24,right: 24),
                  decoration: BoxDecoration(
                    color: Palette().red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("Оставить отзыв", style: TextStyle(color: Colors.white,fontSize: 16 , fontWeight:FontWeight.bold, ),textAlign: TextAlign.center,),

                )),
               Padding(
                   padding: EdgeInsets.only(bottom: 32,),
                   child: Row(
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


                  ],)),





              ],
            ),
          )
        ],
      ),),
    );
  }
}
