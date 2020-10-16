import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carlicense/utils/util_color.dart' as ColorUtil;
import 'package:carlicense/utils/util_image.dart' as ImageUtil;
import 'package:carlicense/utils/util_dimen.dart' as DimenUtil;

class FailedScreen extends StatefulWidget {
  FailedScreen();

  @override
  _FailedScreenState createState() => _FailedScreenState();
}

class _FailedScreenState extends State<FailedScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(color: ColorUtil.color_back),
        child: Column(
          children: <Widget>[
            Expanded(flex: 24, child: Container(),),
            Expanded(flex: 140,
              child: Container(child: ImageUtil.img_logo,),
            ),
            Expanded(flex: 45, child: Container(),),
            Expanded(flex: 48,
              child: Container(child: ImageUtil.img_failed,),
            ),
            Expanded(flex: 28, child: Container(),),
            Expanded(flex: 40,
              child: Container(
                width: 120.0,
                child: OutlineButton(
                  child: Text('TILBAGE',
                    style: TextStyle(
                      fontSize: DimenUtil.font_size_failed_button,
                      color: Colors.white,
                      fontFamily: 'Politi',
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  }, //callback when button is clicked
                  borderSide: BorderSide(
                    color: ColorUtil.color_orange, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: DimenUtil.border_width_main_button, //width of the border
                  ),
                )
              ),
            ),
            Expanded(flex: 42, child: Container(),),
            Expanded(flex: 88, child: Container(child: ImageUtil.img_bottom,),),
            Expanded(flex: 24, child: Container(),),
          ],
        ),
      ),
    );
  }

}