import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:line_icons/line_icons.dart';
import 'package:prayer_time/core/layout/app_spacing.dart';
import 'package:prayer_time/core/layout/app_text_theme.dart';
import 'package:prayer_time/core/local_hive_boxes.dart';
import 'package:prayer_time/core/widgets/custom_appbar.dart';
import 'package:prayer_time/features/location/presentation/widgets/location_menu.dart';
import 'package:prayer_time/features/prayer_times/presentation/controllers/date_time_controller.dart';
import 'package:prayer_time/features/prayer_times/presentation/widgets/prayer_time_date.dart';
import 'package:prayer_time/features/prayer_times/presentation/widgets/prayer_time_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      endDrawer: Drawer(child: Container(), width: 220),
      body: CustomScrollView(
        slivers: [
          HomeScreenAppbar(),
          SliverToBoxAdapter(
            child: Column(children: [
              // CustomAppbar(),
              AppSpacing.kVertical9,
              PrayerTimeDate(),
              AppSpacing.kVertical9,
              ValueListenableBuilder(
                valueListenable:
                    Hive.box(LocalHiveBoxes.PREFERRED_CITY).listenable(),
                builder: (context, value, child) => PrayerTimeWidget(),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class HomeScreenAppbar extends StatelessWidget {
  const HomeScreenAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 140,
      leadingWidth: MediaQuery.of(context).size.width / 2,
      leading: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 8),
          child: LocationMenu(),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: Icon(LineIcons.bars))
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: SvgPicture.asset(
          'assets/images/appbar_background.svg',
          fit: BoxFit.cover,
        ),
        title: Column(children: []),
        centerTitle: true,
      ),
    );
  }
}
