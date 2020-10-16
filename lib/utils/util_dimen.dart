import 'package:flutter_device_type/flutter_device_type.dart';

double border_width_main_button = Device.get().isTablet? 6 : 3;
double border_width_input_contain = Device.get().isTablet? 3 : 2;
double border_width_input_text = Device.get().isTablet? 2 : 1;

double font_size_main_button = Device.get().isTablet? 60 : 40;
double font_size_failed_button = Device.get().isTablet? 18 : 14;
double font_size_input_button = Device.get().isTablet? 18 : 14;

double font_size_input_big = Device.get().isTablet? 22 : 12;
double font_size_input_small = Device.get().isTablet? 16 : 9;
