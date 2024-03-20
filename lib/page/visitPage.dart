import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../palette.dart';
import 'application_Page.dart';
import 'menu_page.dart';

class VisitPage extends StatefulWidget {
  const VisitPage({super.key});


  @override
  State<VisitPage> createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage> {
  SfRangeValues _values = SfRangeValues(2.0, 10.0);

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
                  child: Container(
                      height: 55,
                      child: SvgPicture.asset(
                        'assets/logo.svg',
                      ))),
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

                  Center(child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
               Text("Отметить\nпосещение", textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Color.fromRGBO(254, 220, 143, 1)),),
                                 Text("Нажмите для отображения\nQR-кода", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color:Colors.white),),
                               ],
                             ))
             ],
           )),
            Text("Мои посещения",style: TextStyle(
                fontSize: 30,
                color: Palette().red,
                fontWeight: FontWeight.w900),textAlign: TextAlign.start,),
            Text("До бесплатного посещения: 9 визитов",style: TextStyle(
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
                  min: 2.0,
                  max: 10.0,
                  values: _values,
                  onChanged: (SfRangeValues newValues){
                    setState(() {
                      _values = newValues;
                    });
                  },
                  startThumbIcon: Padding(
                    padding: const EdgeInsets.only(top: 6, left: 2),
                    child: Text(
                      "0",
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
          ],
        ))));
  }
}
