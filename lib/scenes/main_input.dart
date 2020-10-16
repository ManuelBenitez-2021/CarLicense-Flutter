import 'dart:convert';

import 'package:carlicense/models/model_license.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carlicense/utils/util_color.dart' as ColorUtil;
import 'package:carlicense/utils/util_image.dart' as ImageUtil;
import 'package:carlicense/utils/util_dimen.dart' as DimenUtil;
import 'package:carlicense/utils/util_main.dart' as MainUtil;
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_hud/progress_hud.dart';
import 'package:http/http.dart' as http;

class InputScreen extends StatefulWidget {
  InputScreen();

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {

  ProgressHUD progressHUD;
  String carLicense = '';
  LicenseModel licenseModel = LicenseModel();

  Future getCarData() async {
    if (carLicense.isEmpty) {
      Fluttertoast.showToast(
        msg: "The car license is empty.",
        textColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
      );
      return;
    }

    progressHUD.state.show();
    http.Response response = await http.get('https://v1.motorapi.dk/vehicles/' + carLicense, headers: {"X-AUTH-TOKEN":'n66t3eiof4oweh9cu83z4qk6rpuopiwa'});
    if(response.body.isNotEmpty) {
      var jsonData = json.decode(response.body);
      LicenseModel model = LicenseModel.fromJson(jsonData);
      licenseModel = model;
    } else {
      Navigator.of(context).pushNamed('/failed').then((val)=>val? onRefresh() : null);;
    }
    setState(() {
      progressHUD.state.dismiss();
    });
  }

  void onRefresh() {
    licenseModel = LicenseModel();
    setState(() {  });
  }

  @override
  void initState() {
    super.initState();

    progressHUD = new ProgressHUD(
      backgroundColor: Colors.black45,
      color: Colors.black,
      containerColor: Colors.white,
      borderRadius: 5.0,
      loading: false,
      text: 'Loading...',
    );

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: new BoxDecoration(color: ColorUtil.color_back),
            child: Column(
              children: <Widget>[
                Expanded(flex: 18, child: Container(),),
                Expanded(flex: 64,
                  child: Row(
                    children: <Widget> [
                      Expanded(flex: 20, child: Container(),),
                      Expanded(flex: 180,
                        child: Container(
                          alignment: AlignmentDirectional.centerStart,
                          child: ImageUtil.img_logo,
                        ),
                      ),
                      Expanded(flex: 285, child: Container(),),
                      Expanded(flex: 170,
                        child: Container(
                          child: ImageUtil.img_bottom,
                        ),
                      ),
                      Expanded(flex: 20, child: Container(),),
                    ],
                  ),),
                Expanded(flex: 15, child: Container(),),
                Expanded(flex: 296, child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 85, child: Container(),),
                      Expanded(flex: 515,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorUtil.color_orange, width: DimenUtil.border_width_input_contain),
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(flex: 1,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(Device.get().isTablet? 24 : 12, Device.get().isTablet? 16 : 8, 0, 0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text('BIL INFO:', style: MainUtil.txtInputBigBoldOrangeTheme,),
                                      ),

                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 16 : 8, 0, 0),
                                        child: Text('Nummerplade:', style: MainUtil.txtInputSmallOrangeTheme,),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text(licenseModel.registration_number == null? '': licenseModel.registration_number, style: MainUtil.txtInputBigWhtieTheme,),
                                      ),

                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 6 : 0, 0, 0),
                                        child: Text('Mærke:', style: MainUtil.txtInputSmallOrangeTheme,),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text(licenseModel.make == null? '' : licenseModel.make, style: MainUtil.txtInputBigWhtieTheme,),
                                      ),

                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 6 : 0, 0, 0),
                                        child: Text('Model:', style: MainUtil.txtInputSmallOrangeTheme,),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text(licenseModel.model == null? '' : licenseModel.model, style: MainUtil.txtInputBigWhtieTheme,),
                                      ),

                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 6 : 0, 0, 0),
                                        child: Text('Variant:', style: MainUtil.txtInputSmallOrangeTheme,),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text(licenseModel.variant == null? '' : licenseModel.variant, style: MainUtil.txtInputBigWhtieTheme,),
                                      ),

                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 6 : 0, 0, 0),
                                        child: Text('Art:', style: MainUtil.txtInputSmallOrangeTheme,),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text(licenseModel.type == null? '' : licenseModel.type, style: MainUtil.txtInputBigWhtieTheme,),
                                      ),

                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 6 : 0, 0, 0),
                                        child: Text('Anvendelse:', style: MainUtil.txtInputSmallOrangeTheme,),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text(licenseModel.use == null? '' : licenseModel.use, style: MainUtil.txtInputBigWhtieTheme,),
                                      ),

                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 6 : 0, 0, 0),
                                        child: Text('Stelnummer:', style: MainUtil.txtInputSmallOrangeTheme,),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text(licenseModel.vin == null? '' : licenseModel.vin, style: MainUtil.txtInputBigWhtieTheme,),
                                      ),

                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 16 : 8, 0, 0),
                                        child: Text('Status:', style: MainUtil.txtInputSmallOrangeTheme,),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text(licenseModel.status == null? '' : licenseModel.status, style: MainUtil.txtInputBigGreenTheme,),
                                      ),

                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 6 : 0, 0, 0),
                                        child: Text('Registreringsdato:', style: MainUtil.txtInputSmallOrangeTheme,),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text(licenseModel.status_date == null? '' : licenseModel.status_date, style: MainUtil.txtInputBigWhtieTheme,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: DimenUtil.border_width_input_contain,
                                height: double.infinity,
                                color: ColorUtil.color_orange,
                              ),
                              Expanded(flex: 1,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(Device.get().isTablet? 24 : 12, Device.get().isTablet? 16 : 8, 0, 0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text('FORSIKRING:', style: MainUtil.txtInputBigBoldOrangeTheme,),
                                      ),

                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 16 : 8, 0, 0),
                                        child: Text('Status:', style: MainUtil.txtInputSmallOrangeTheme,),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text('', style: MainUtil.txtInputBigGreenTheme,),
                                      ),

                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 6 : 0, 0, 0),
                                        child: Text('Selskab:', style: MainUtil.txtInputSmallOrangeTheme,),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text('', style: MainUtil.txtInputBigWhtieTheme,),
                                      ),

                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 6 : 0, 0, 0),
                                        child: Text('Oprettet:', style: MainUtil.txtInputSmallOrangeTheme,),
                                      ),
                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text(licenseModel.first_registration == null? '' : licenseModel.first_registration, style: MainUtil.txtInputBigWhtieTheme,),
                                      ),

                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 16 : 8, 0, 0),
                                        alignment: AlignmentDirectional.centerStart,
                                        child: Text('SYN:', style: MainUtil.txtInputBigBoldOrangeTheme,),
                                      ),

                                      Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 16 : 8, 0, 0),
                                        child: Row(
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  child: Text('Dato:', style: MainUtil.txtInputSmallOrangeTheme,),
                                                ),
                                                Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  child: Text('', style: MainUtil.txtInputBigWhtieTheme,),
                                                ),

                                                Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 6 : 0, 0, 0),
                                                  child: Text('Dato:', style: MainUtil.txtInputSmallOrangeTheme,),
                                                ),
                                                Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  child: Text('', style: MainUtil.txtInputBigWhtieTheme,),
                                                ),

                                                Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 6 : 0, 0, 0),
                                                  child: Text('Dato:', style: MainUtil.txtInputSmallOrangeTheme,),
                                                ),
                                                Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  child: Text('', style: MainUtil.txtInputBigWhtieTheme,),
                                                ),
                                              ],
                                            ),

                                            Container(
                                              margin: EdgeInsets.fromLTRB(Device.get().isTablet? 64 : 32, 0, 0, 0),
                                            ),

                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  child: Text('Resultat', style: MainUtil.txtInputSmallOrangeTheme,),
                                                ),
                                                Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  child: Text('', style: MainUtil.txtInputBigGreenTheme,),
                                                ),

                                                Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 6 : 0, 0, 0),
                                                  child: Text('Resultat', style: MainUtil.txtInputSmallOrangeTheme,),
                                                ),
                                                Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  child: Text('', style: MainUtil.txtInputBigGreenTheme,),
                                                ),

                                                Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 6 : 0, 0, 0),
                                                  child: Text('Resultat', style: MainUtil.txtInputSmallOrangeTheme,),
                                                ),
                                                Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  child: Text('', style: MainUtil.txtInputBigGreenTheme,),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),

                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, Device.get().isTablet? 16 : 8, 0, 0),
                                        child: Row(
                                          children: <Widget>[
                                            Text('EFTERLYST:  ', style: MainUtil.txtInputBigBoldOrangeTheme,),
                                            Text('', style: MainUtil.txtInputBigGreenTheme,),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(flex: 85, child: Container(),),
                    ],
                  ),
                ),),
                Expanded(flex: 12, child: Container(),),
                Expanded(flex: 64,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 85, child: Container(),),
                        Expanded(flex: 270,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: DimenUtil.border_width_input_text),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red, width: DimenUtil.border_width_input_contain),
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: Colors.white
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(1.0),
                                    child: ImageUtil.img_left,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: TextField(
                                          autofocus: false,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                              hintText: 'Registreringsnummer'
                                          ),
                                          onChanged: (val) {
                                            carLicense = val;
                                          },
                                          style: TextStyle(fontSize: Device.get().isTablet? 28 : 20),
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: 20, child: Container(),),
                        Expanded(flex: 100,
                          child: Container(
                            child: OutlineButton(
                              child: Text('SØG',
                                style: TextStyle(
                                  fontSize: DimenUtil.font_size_input_button,
                                  color: Colors.white,
                                  fontFamily: 'Politi',
                                ),
                              ),
                              onPressed: () {
                                getCarData();
                              }, //callback when button is clicked
                              borderSide: BorderSide(
                                  color: ColorUtil.color_orange, //Color of the border
                                  style: BorderStyle.solid, //Style of the border
                                  width: DimenUtil.border_width_input_text
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: 20, child: Container(),),
                        Expanded(flex: 100,
                          child: Container(
                            child: OutlineButton(
                              child: Text('TILBAGE',
                                style: TextStyle(
                                  fontSize: DimenUtil.font_size_input_button,
                                  color: Colors.white,
                                  fontFamily: 'Politi',
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }, //callback when button is clicked
                              borderSide: BorderSide(
                                  color: ColorUtil.color_orange, //Color of the border
                                  style: BorderStyle.solid, //Style of the border
                                  width: DimenUtil.border_width_input_text
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: 85, child: Container(),),
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 12, child: Container(),),
              ],
            ),
          ),
          progressHUD,
        ],
      )

    );
  }

}