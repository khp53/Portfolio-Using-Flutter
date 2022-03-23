import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Contact extends ParseObject implements ParseCloneable {
  get name => get("name");
  get email => get("email");
  get subject => get("subject");
  get message => get("message");

  Contact() : super("Contact");
  Contact.clone() : this();
  @override
  clone(Map<String, dynamic> map) => Contact.clone()..fromJson(map);
}
