import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:prayer_time/core/layout/app_colors.dart';
import 'package:prayer_time/core/layout/app_text_theme.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prayer_time/features/location/data/datasource/location_local_datasource.dart';
import 'package:prayer_time/features/location/data/respository/location_repository_impl.dart';
import 'package:prayer_time/features/location/presentation/widgets/location_menu.dart';

void main() async {
  await Hive.initFlutter();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          bodyLarge: AppTextTheme.bodyLarge,
          bodyMedium: AppTextTheme.bodyMedium,
          bodySmall: AppTextTheme.bodySmall,
        ),
      ),
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [LocationMenu()],
        ),
      )),
    );
  }
}
