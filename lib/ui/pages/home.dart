import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/provider/page.dart';

import 'package:vertical_landing_page/ui/shared/app_menu.dart';
import 'package:vertical_landing_page/ui/views/about.dart';
import 'package:vertical_landing_page/ui/views/contact.dart';
import 'package:vertical_landing_page/ui/views/home.dart';
import 'package:vertical_landing_page/ui/views/location.dart';
import 'package:vertical_landing_page/ui/views/pricing.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _buildBoxDecoration(),
        child: Stack(
          children: const [
            _HomeBody(),
            Positioned(
              right: 20,
              top: 20,
              child: AppMenu(),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink,
            Colors.purpleAccent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5],
        ),
      );
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageProvider = context.read<PageProvider>();

    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      children: const [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}
