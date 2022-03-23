import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Resume extends ParseObject implements ParseCloneable {
  ParseFileBase get resume => get("resume");

  Resume() : super("Resume");
  Resume.clone() : this();
  @override
  clone(Map<String, dynamic> map) => Resume.clone()..fromJson(map);
}
