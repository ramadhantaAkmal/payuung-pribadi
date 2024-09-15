import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuIconWidget extends StatelessWidget {
  final String menuName, assetName;
  final bool isNewMenu;
  final GestureTapCallback onTap;
  const MenuIconWidget(
      {super.key,
      required this.menuName,
      required this.onTap,
      required this.assetName,
      required this.isNewMenu});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Badge(
                label: const Text("New"),
                isLabelVisible: isNewMenu,
                child: SvgPicture.asset(
                  assetName,
                  semanticsLabel: '',
                  height: 35,
                ),
              ),
              Text(
                menuName,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
