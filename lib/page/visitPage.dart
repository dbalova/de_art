import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../custom_widget/footer.dart';
import '../main.dart';
import '../palette.dart';
import '../service/global.dart';
import 'application_Page.dart';
import 'menu_page.dart';

class VisitPage extends StatefulWidget {
  const VisitPage({super.key});


  @override
  State<VisitPage> createState() => _VisitPageState();
}
bool _isQr = false;
class _VisitPageState extends State<VisitPage> {
  SfRangeValues _values = SfRangeValues(4.0, 10.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
              backgroundColor: Colors.white,
              leading: GestureDetector(
                  onTap: () {
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
                  child: GestureDetector(
                      onTap: (){Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => MyHomePage(title: 'De Art 13'),
                        ),
                            (route) => false,//if you want to disable back feature set to false
                      );},
                      child:Container(
                      height: 55,
                      child: SvgPicture.asset(
                        'assets/logo.svg',
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
                          'assets/call.svg',
                        )))
              ],
            )),
        body: SingleChildScrollView(
            child:Container(
                padding: EdgeInsets.only(left: 15,right: 15, top:0),
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        GestureDetector(
            onTap: (){
              _isQr = !_isQr;
              setState(() {

              });
            },

            child: _isQr ?
            Container(
                margin: EdgeInsets.only(bottom:0),
                height:300,
                child: Stack(
                  children: [
                    Center(child: Container(
                      margin: EdgeInsets.only(top:0, ),
                      child: SvgPicture.asset(
                        'assets/bg2.svg',
                      ),
                    )),

                    Center(child:
                    Container(
                    child: QrImageView(
                      eyeStyle: QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                          color: Colors.white) ,
                      dataModuleStyle: QrDataModuleStyle(color: Colors.white,dataModuleShape: QrDataModuleShape.square),
                      //backgroundColor: Colors.white,
                      data: myPhone,
                      version: QrVersions.auto,
                      size: 200,
                      gapless: false,
                    ),
                    ))
                  ],
                ))
                :Container(
            margin: EdgeInsets.only(bottom:0),
              height:300,
              child: Stack(
             children: [
              Center(child: Container(
                  margin: EdgeInsets.only(top:0, ),
                  child: SvgPicture.asset(
                    'assets/bg2.svg',
                  ),
                )),

                  Center(child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
               Text("Отметить\nпосещение", textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Color.fromRGBO(254, 220, 143, 1)),),
                                 Text("Нажмите для отображения\nQR-кода", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color:Colors.white),),
                               ],
                             ))
             ],
           ))),
            Text("Мои посещения",style: TextStyle(
                fontSize: 30,
                color: Palette().red,
                fontWeight: FontWeight.w900),textAlign: TextAlign.start,),
            Text("До бесплатного посещения: 4 визита",style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                ),textAlign: TextAlign.start,),
            SfRangeSliderTheme(
                data: SfRangeSliderThemeData(
                  thumbColor: Color.fromRGBO(217, 217, 217, 1),
                  activeTrackColor: Color.fromRGBO(217, 217, 217, 1),
                  inactiveTrackColor: Color.fromRGBO(140, 40, 57, 1),
                  thumbRadius: 24,
                  activeTrackHeight: 19,
                  inactiveTrackHeight: 19,
                ),
                child:  SfRangeSlider(
                  min: 0.0,
                  max: 10.0,
                  values: _values,
                  onChanged: (SfRangeValues newValues){
                    setState(() {
                      //_values = newValues;
                    });
                  },
                  startThumbIcon: Padding(
                    padding: const EdgeInsets.only(top: 6, left: 2),
                    child: Text(
                      "4",
                      style:  TextStyle(color: Colors.black, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  endThumbIcon: Padding(
                    padding: const EdgeInsets.only(top: 6, left: 2),
                    child: Text(
                      "10",
                      style:  TextStyle(color: Colors.black, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ),
           SizedBox(height: 24,),

            Center(child: Text("Остались вопросы? Звоните!",style: TextStyle(
                fontSize: 20,
                color: Palette().red,
                fontWeight: FontWeight.w900),textAlign: TextAlign.center,)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_phone, color: Colors.black,),
                Text("+7 (000) 000 00 00",style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),textAlign: TextAlign.start,),
              ],
            ),
            SizedBox(height: 24,),
      Center(child:      Text("Или пишите:",style: TextStyle(
                fontSize: 20,
                color: Palette().red,
                fontWeight: FontWeight.w900),textAlign: TextAlign.start,)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap:(){URL_WA();},
                    child:Container(
                        height: 45,
                        width: 45,
                        child:SvgPicture.asset(
                          'assets/WA-BLACK.svg',
                        ))),
                SizedBox(width: 15,),

                GestureDetector(
                    onTap:(){URL_TG();},
                    child:Container(
                      height: 45,
                        width: 45,
                        child:SvgPicture.asset(
                          'assets/TE-BLACK.svg',
                        ))),
              ],
            ),
            SizedBox(height: 24,),
Center(child:            TextButton(onPressed: (){}, child: Text("Правила программы лояльности",
              style: TextStyle(decoration: TextDecoration.underline, color: Colors.grey),)))


          ],
        ))));
  }
}
