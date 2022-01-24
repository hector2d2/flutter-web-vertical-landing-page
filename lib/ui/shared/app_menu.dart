import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:vertical_landing_page/provider/page.dart';

import 'package:vertical_landing_page/ui/shared/menu_item.dart';

class AppMenu extends StatefulWidget {
  const AppMenu({Key? key}) : super(key: key);

  @override
  State<AppMenu> createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = context.read<PageProvider>();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          isOpen ? controller.reverse() : controller.forward();
          isOpen = !isOpen;
          setState(() {});
        },
        child: Container(
          padding: EdgeInsets.all(10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(
                isOpen: isOpen,
                controller: controller,
              ),
              if (isOpen) ...[
                MenuItem(
                  text: 'Home',
                  onPressed: () => pageProvider.goTo(0),
                  delay: 0,
                ),
                MenuItem(
                  text: 'About',
                  onPressed: () => pageProvider.goTo(1),
                  delay: 30,
                ),
                MenuItem(
                  text: 'Pricing',
                  onPressed: () => pageProvider.goTo(2),
                  delay: 60,
                ),
                MenuItem(
                  text: 'Contact',
                  onPressed: () => pageProvider.goTo(3),
                  delay: 90,
                ),
                MenuItem(
                  text: 'Location',
                  onPressed: () => pageProvider.goTo(4),
                  delay: 120,
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(
            milliseconds: 200,
          ),
          curve: Curves.easeInOut,
          width: isOpen ? 45 : 0,
        ),
        Text(
          'Menú',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        Spacer(),
        AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: controller,
          color: Colors.white,
        ),
      ],
    );
  }
}
