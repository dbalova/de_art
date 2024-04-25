import 'package:de_art/page/tyPage.dart';
import 'package:de_art/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../custom_widget/footer.dart';
import '../service/api.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

TextEditingController _nameController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
TextEditingController _messageController = TextEditingController();

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
                  child:GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Ваше имя",style: TextStyle(fontWeight: FontWeight.bold)),),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Номер телефона",style: TextStyle(fontWeight: FontWeight.bold)),),
                Container(
                  padding: EdgeInsets.only(left:12),
                  width: MediaQuery.of(context).size.width/1.5,
                  child: TextField(
keyboardType: TextInputType.phone,
                    controller: _phoneController,
                    decoration: const InputDecoration(
                    hintText: "+7 999 999 99 99",
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
                  padding: EdgeInsets.only(left:12),
                  margin: EdgeInsets.only(top:24),
                  width: MediaQuery.of(context).size.width/1.5,
                  height:MediaQuery.of(context).size.height/5,
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                    hintText: "Комментарий",
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
                     if((_nameController.text!="")&(_phoneController.text!=""))
                     {

                       var _res=  await recall(_nameController.text.toString(),_phoneController.text.toString(), _messageController.text.toString());
                       if (_res=="success"){
                         Navigator.pop(context);
                       Navigator.of(context).push(PageRouteBuilder(
                           opaque: false,
                           pageBuilder: (BuildContext context, _, __) =>
                               TyPage()));
                       }
                       else {Fluttertoast.showToast(
                           msg: "Запрос не отправлен!",
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

                 /*  Navigator.pop(context);
                   Navigator.of(context).push(PageRouteBuilder(
                       opaque: false,
                       pageBuilder: (BuildContext context, _, __) =>
                           TyPage()));*/
                 },
                 child:   Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  margin: EdgeInsets.only(top: 15, bottom: 15,),
                  padding: EdgeInsets.only(top: 15, bottom: 15,left: 24,right: 24),
                  decoration: BoxDecoration(
                    color: Palette().red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("Оставить заявку", style: TextStyle(color: Colors.white,fontSize: 16 , fontWeight:FontWeight.bold, ),textAlign: TextAlign.center,),

                )),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    GestureDetector(
                        onTap:(){URL_WA();},
                        child:SvgPicture.asset(
                          'assets/redWa.svg',
                        )),
                    Spacer(flex: 1),
                    GestureDetector(
                        onTap:(){URL_TG();},
                        child:SvgPicture.asset(
                          'assets/redTg.svg',
                        )),
                    Spacer(flex: 1),
                    GestureDetector(
                        onTap:(){URL_VIBER();},
                        child: SvgPicture.asset(
                          'assets/redViber.svg',
                        )),
                    Spacer(flex: 1),
                    GestureDetector(
                        onTap:(){URL_VK();},
                        child:SvgPicture.asset(
                          'assets/redVk.svg',
                        )),

                  ],
                ),



              ],
            ),
          )
        ],
      ),),
    );
  }
}
