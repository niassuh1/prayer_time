import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prayer_time/core/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(child: Container(), width: 220),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(children: [CustomAppbar()]),
          )
        ],
      ),
    );
  }
}
