import 'package:carrout_market_ui/models/icon_menu.dart';
import 'package:carrout_market_ui/theme.dart';
import 'package:flutter/material.dart';

class CardIconMenu extends StatelessWidget {
  const CardIconMenu({Key? key, required this.iconMenuList}) : super(key: key);

  final List<IconMenu> iconMenuList;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Padding(
        padding: const EdgeInsets.all(0.6),
        child: Column(
          children: List.generate(
            iconMenuList.length,
            (index) => _builRowIconItem(
                iconMenuList[index].title, iconMenuList[index].iconData),
          ),
        ),
      ),
    );
  }

  Widget _builRowIconItem(String title, IconData iconData) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Icon(iconData, size: 17),
          const SizedBox(width: 20),
          Text(title, style: textTheme().subtitle1),
        ],
      ),
    );
  }
}
