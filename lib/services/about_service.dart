import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:portfolio/models/about.dart';

class AboutService {
  Future<About?> getAboutStuff() async {
    QueryBuilder<About> query = QueryBuilder<About>(About());
    About? about = await query.first();
    return about;
  }
}
