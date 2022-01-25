import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:vertical_landing_page/provider/page.dart';

import 'package:vertical_landing_page/ui/pages/home.dart';

final homeHandler = Handler(
  handlerFunc: (context, params) {
    final page = params['page']!.first;

    if (page != '/') {
      final pageProvider = context!.read<PageProvider>();
      pageProvider.createScrollController(page);
      return const HomePage();
    }
  },
);
