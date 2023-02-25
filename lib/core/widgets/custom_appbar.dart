import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:line_icons/line_icons.dart';
import 'package:prayer_time/core/layout/app_spacing.dart';
import 'package:prayer_time/core/layout/app_text_theme.dart';
import 'package:prayer_time/features/location/presentation/widgets/location_menu.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(32))),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          SvgPicture.asset(
            'assets/images/appbar_background.svg',
            width: MediaQuery.of(context).size.width,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocationMenu(),
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: Icon(LineIcons.bars),
                      ),
                    ],
                  ),
                  AppSpacing.kVertical10,
                  Text('Fajr Prayer'),
                  AppSpacing.kVertical4,
                  Text(
                    '4:34 AM',
                    style: AppTextTheme.h1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
