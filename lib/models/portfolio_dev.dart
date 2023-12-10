import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class PortfolioDev extends ParseObject implements ParseCloneable {
  ParseFileBase get devPortfolio => get("DevPortfolio");
  PortfolioDev() : super("DevPortfolio");
  PortfolioDev.clone() : this();
  @override
  clone(Map<String, dynamic> map) => PortfolioDev.clone()..fromJson(map);
}
