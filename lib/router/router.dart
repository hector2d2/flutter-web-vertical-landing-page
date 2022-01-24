import 'package:fluro/fluro.dart';

import './router_handler.dart';

class RouterApp {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    // rutas
    router.define('/:page', handler: homeHandler);

    // 404
    router.notFoundHandler = homeHandler;
  }
}
