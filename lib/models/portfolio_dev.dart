import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class PortfolioDev extends ParseObject implements ParseCloneable {
  ParseFileBase? get screen1 => get("screen1");
  ParseFileBase? get screen2 => get("screen2");
  ParseFileBase? get screen3 => get("screen3");
  ParseFileBase? get screen4 => get("screen4");
  ParseFileBase? get screen5 => get("screen5");
  ParseFileBase? get screen6 => get("screen6");
  ParseFileBase? get screen7 => get("screen7");
  ParseFileBase? get screen8 => get("screen8");
  ParseFileBase? get screen9 => get("screen9");
  ParseFileBase? get screen10 => get("screen10");

  PortfolioDev() : super("DevPortfolio");
  PortfolioDev.clone() : this();
  @override
  clone(Map<String, dynamic> map) => PortfolioDev.clone()..fromJson(map);
}
