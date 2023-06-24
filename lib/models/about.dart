import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class About extends ParseObject implements ParseCloneable {
  ParseFileBase get riveAnimation => get("riveAnimation");
  ParseFileBase get location => get("location");

  About() : super("about");
  About.clone() : this();
  @override
  clone(Map<String, dynamic> map) => About.clone()..fromJson(map);
}
