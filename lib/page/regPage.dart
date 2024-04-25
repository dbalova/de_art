import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:de_art/page/visitPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../palette.dart';

import '../service/global.dart';
import 'application_Page.dart';
import 'menu_page.dart';

class regPage extends StatefulWidget {
  const regPage({super.key});

  @override
  State<regPage> createState() => _regPageState();
}

bool _isActive= true;
bool page1 = true;
TextEditingController _phoneController = TextEditingController();

TextEditingController _pass1 = TextEditingController();
TextEditingController _pass2 = TextEditingController();
TextEditingController _pass3 = TextEditingController();
TextEditingController _pass4 = TextEditingController();
TextEditingController _pass5 = TextEditingController();
TextEditingController _pass6 = TextEditingController();

FocusNode _focus1 = FocusNode();
FocusNode _focus2 = FocusNode();
FocusNode _focus3 = FocusNode();
FocusNode _focus4 = FocusNode();
FocusNode _focus5 = FocusNode();
FocusNode _focus6 = FocusNode();

class _regPageState extends State<regPage> {

  @override
  void initState() {
    _phoneController.text="+7";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(

          backgroundColor: Colors.white,
          leading:GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const MenuPage(),
                  ),
                );
              },
              child: Container(
                  margin: EdgeInsets.only(left: 12, top: 12),
                  height: 62,
                  child: SvgPicture.asset(
                    'assets/menu.svg',
                  ))),
          title: Center(
              child: Container(
                  height: 55,
                  child: SvgPicture.asset(
                    'assets/logo.svg',
                  ))),
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
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Divider(color: Palette().red),
        SingleChildScrollView(
          child:

          page1 ? Container(
              padding: EdgeInsets.only(left: 15,right: 15, top:28),
              child:Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child:Text("Добро\nпожаловать!",       style: TextStyle(
                fontSize: 30,
                color: Palette().red,
                fontWeight: FontWeight.w900),textAlign: TextAlign.start,),),
            Text("Зарегистрируйтесь в нашей программе лояльности и получите В ПОДАРОК каждое 10-ое посещение любого из сети отелей De Art 13",
              style: TextStyle(fontSize: 18),),

                Container(
                  height: 48,
                  margin: EdgeInsets.only(top:40),
                  padding: EdgeInsets.only(left: 16,right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Palette().red,
                      width: 1,
                    ),
                  ),
                  child: Center(child:TextField(
                    keyboardType: TextInputType.phone,
                    maxLength: 12,
                    controller: _phoneController,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "+9 999 999 99 99",
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                  )),
                ),

                GestureDetector(
                    onTap: ()async{
                   if((_phoneController.text.length==12)&(_phoneController.text.contains("+7")))   {
                                  await FirebaseAuth.instance.verifyPhoneNumber(
                                    phoneNumber: _phoneController.text,
                                    verificationCompleted: (PhoneAuthCredential
                                        credential) async {},
                                    verificationFailed:
                                        (FirebaseAuthException e) {},
                                    codeSent: (String verificationId,
                                        int? resendToken) async {
                                      verify = verificationId;
                                      page1 = false;
                                      setState(() {});
                                    },
                                    //timeout: const Duration(seconds: 60),
                                    codeAutoRetrievalTimeout:
                                        (String verificationId) {},
                                  );
                                }

                   else Fluttertoast.showToast(
                       msg: "Некорректный номер телефона",
                       toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.CENTER,
                       timeInSecForIosWeb: 1,
                       backgroundColor: Colors.red,
                       textColor: Colors.white,
                       fontSize: 16.0
                   );
                              },
                    child:Container(
                  height: 48,
                  margin: EdgeInsets.only(top:12, bottom: 32),
                  padding: EdgeInsets.only(left: 16,right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
color: Palette().red,
                  ),
                  child: Center(child:Text("Получить код по СМС",style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)),
                )),
                TextButton(onPressed: ()async{

                }, child: Text("Правила программы лояльности",
                  style: TextStyle(decoration: TextDecoration.underline, color: Colors.grey),))

          ],))
              : Container(
              padding: EdgeInsets.only(left: 15,right: 15, top:32),
              child:Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child:Text("Добро\nпожаловать!",       style: TextStyle(
                      fontSize: 30,
                      color: Palette().red,
                      fontWeight: FontWeight.w900),textAlign: TextAlign.start,),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   GestureDetector(
                       onTap: (){page1 = true;
                         setState(() {

                         });},
                       child: Icon(Icons.arrow_back)),
                    SizedBox(width: 12,),
                    Text("Код отправлен на  ${_phoneController.text}",
                      style: TextStyle(fontSize: 18),),
                  ],
                ),

              Container(
                 // width: MediaQuery.of(context).size.width-30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                     // height: 66,
                      width: (MediaQuery.of(context).size.width-30)/7,
                      margin: EdgeInsets.only(top:40),
                      padding: EdgeInsets.only(left: 8,right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Palette().red,
                          width: 1,
                        ),
                      ),
                      child: Center(child:TextField(
                        onChanged: (_pass1){
                          _pass1.length==1 ?
                          FocusScope.of(context).requestFocus(_focus2):FocusScope.of(context).requestFocus(_focus1);},
                        maxLength: 1,
                        focusNode: _focus1,
                      controller:  _pass1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),

                        decoration: InputDecoration(
                          counterText: '',
                          hintText: "",
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                      )),
                    ),
                    Container(
                    //  height: 66,
                      width: (MediaQuery.of(context).size.width-30)/7,
                      margin: EdgeInsets.only(top:40),
                      padding: EdgeInsets.only(left: 8,right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Palette().red,
                          width: 1,
                        ),
                      ),
                      child: Center(child:TextField(
                        onChanged: (_pass2){
                          _pass2.length==1 ?
                          FocusScope.of(context).requestFocus(_focus3):FocusScope.of(context).requestFocus(_focus1);},
                        maxLength: 1,
                        focusNode: _focus2,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                        controller: _pass2,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: "",
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                      )),
                    ),
                    Container(
                     // height: 66,
                      width: (MediaQuery.of(context).size.width-30)/7,
                      margin: EdgeInsets.only(top:40),
                      padding: EdgeInsets.only(left: 8,right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Palette().red,
                          width: 1,
                        ),
                      ),
                      child: Center(child:TextField(
                        onChanged: (_pass3){
                          _pass3.length==1 ?
                          FocusScope.of(context).requestFocus(_focus4):FocusScope.of(context).requestFocus(_focus2);},
                        maxLength: 1,
                        focusNode: _focus3,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                        controller: _pass3,
                        decoration: InputDecoration(
                          hintText: "",
                          counterText: '',
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                      )),
                    ),
                    Container(
                    //  height: 66,
                      width: (MediaQuery.of(context).size.width-30)/7,
                      margin: EdgeInsets.only(top:40),
                      padding: EdgeInsets.only(left: 8,right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Palette().red,
                          width: 1,
                        ),
                      ),
                      child: Center(child:TextField(
                        onChanged: (_pass4){
                          _pass4.length==1 ?
                          FocusScope.of(context).requestFocus(_focus5):FocusScope.of(context).requestFocus(_focus3);},
                        maxLength: 1,
                        focusNode: _focus4,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                        controller: _pass4,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: "",
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                      )),
                    ),
                    Container(
                      //  height: 66,
                      width: (MediaQuery.of(context).size.width-30)/7,
                      margin: EdgeInsets.only(top:40),
                      padding: EdgeInsets.only(left: 8,right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Palette().red,
                          width: 1,
                        ),
                      ),
                      child: Center(child:TextField(
                        onChanged: (_pass5){
                          _pass5.length==1 ?
                          FocusScope.of(context).requestFocus(_focus6):FocusScope.of(context).requestFocus(_focus4);},
                        maxLength: 1,
                        focusNode: _focus5,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                        controller: _pass5,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: "",
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                      )),
                    ),
                    Container(
                      //  height: 66,
                      width: (MediaQuery.of(context).size.width-30)/7,
                      margin: EdgeInsets.only(top:40),
                      padding: EdgeInsets.only(left: 8,right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Palette().red,
                          width: 1,
                        ),
                      ),
                      child: Center(child:TextField(
                        onChanged: (_pass6){
                          _pass6.length==1 ?
                          FocusScope.of(context).requestFocus(_focus6):FocusScope.of(context).requestFocus(_focus5);},
                        maxLength: 1,
                        focusNode: _focus6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                        controller: _pass6,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: "",
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                      )),
                    )
                  ],
                )),

               GestureDetector(
                   onTap: ()async{
                    late String smsCode;
                    myPhone=_phoneController.text;
                     smsCode = _pass1.text + _pass2.text+ _pass3.text+_pass4.text+_pass5.text+_pass6.text;
                     print(smsCode);

                    try{
                                  PhoneAuthCredential credential =
                                      PhoneAuthProvider.credential(
                                          verificationId: verify,
                                          smsCode: smsCode);

                                  // Sign the user in (or link) with the credential
                                  await FirebaseAuth.instance
                                      .signInWithCredential(credential);
                                  FirebaseFirestore.instance.collection("visits").snapshots();
                                  Navigator.of(context).push(PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder: (BuildContext context, _, __) =>
                                          VisitPage()));
                                }
                                catch(e){
                      print("WRONG");
                    }
                                /*   if (_isActive==true) {
                       _start = 60;
                       startTimer();

                     }*/
                   },
                   child: Container(
                  height: 48,
                  margin: EdgeInsets.only(top:12, bottom: 32),
                  padding: EdgeInsets.only(left: 16,right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                   color: _isActive? Palette().red: Colors.grey,
                  ),
                  child: Center(child:
                 _isActive? Text("Отправить",style:
                    TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)
                  :Text("Отправить еще раз 00:$_start",style:
                 TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)
                  ),
                )),
                TextButton(onPressed: (){
                /*  Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) =>
                          VisitPage()));*/
                }, child: Text("Правила программы лояльности",
                  style: TextStyle(decoration: TextDecoration.underline, color: Colors.grey),))

              ],))
        ),
      ],
    ),

    );
  }
  late Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _isActive=false;
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _isActive=true;

          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}

