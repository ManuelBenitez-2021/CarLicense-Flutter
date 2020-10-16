import 'package:carlicense/scenes/main_failed.dart';
import 'package:carlicense/scenes/main_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:carlicense/utils/util_color.dart' as ColorUtil;
import 'package:carlicense/utils/util_image.dart' as ImageUtil;
import 'package:carlicense/utils/util_dimen.dart' as DimenUtil;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      title: 'Car License',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder> {
        '/main': (BuildContext context) => new MainScreen(),
        '/input': (BuildContext context) => new InputScreen(),
        '/failed': (BuildContext context) => new FailedScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(color: ColorUtil.color_back),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 24, child: Container(),),
            Expanded(
              child: Container(
                child: ImageUtil.img_logo,
              ),
              flex: 140,
            ),
            Expanded(flex: 44, child: Container(),),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(flex: 212, child: Container(),),
                  Expanded(
                    child:Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: OutlineButton(
                          child: Text('SØG',
                            style: TextStyle(
                              fontSize: DimenUtil.font_size_main_button,
                              color: Colors.white,
                              fontFamily: 'Politi',
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/input');
                            // Navigator.of(context).pushNamed('/failed');
                          }, //callback when button is clicked
                          borderSide: BorderSide(
                            color: Colors.white, //Color of the border
                            style: BorderStyle.solid, //Style of the border
                            width: DimenUtil.border_width_main_button, //width of the border
                          ),
                        )
                    ),
                    flex: 250,
                  ),
                  Expanded(flex: 212, child: Container(),),
                ],
              ),
              flex: 85,
            ),
            Expanded(flex: 75, child: Container(),),
            Expanded(flex: 88, child: Container(
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: ImageUtil.img_bottom,
            ),),
            Expanded(flex: 25, child: Container(),),
          ],
        ),
      ),
    );
  }
}
