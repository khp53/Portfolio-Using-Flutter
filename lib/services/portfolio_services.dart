import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:portfolio/models/portfolio_dev.dart';

class PortfolioServices {
  getPortfolioDev() async {
    QueryBuilder<PortfolioDev> query =
        QueryBuilder<PortfolioDev>(PortfolioDev());
    return await query.find();
  }
}
