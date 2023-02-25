import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:prayer_time/core/layout/app_spacing.dart';
import 'package:prayer_time/core/layout/app_text_theme.dart';
import 'package:prayer_time/features/location/presentation/controllers/city_controller.dart';

import 'package:prayer_time/features/location/presentation/widgets/cities_bottom_modal.dart';

class LocationMenu extends ConsumerWidget {
  const LocationMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: getPreferredCity(),
      builder: (context, snapshot) => ValueListenableBuilder(
        valueListenable: Hive.box('preferred_city').listenable(),
        builder: (context, value, child) {
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: .65,
                    child: Text(
                      'Location',
                      style: AppTextTheme.bodySmall!.copyWith(height: .5),
                    ),
                  ),
                  AppSpacing.kVertical2,
                  Text(value.get('city') ?? '', style: AppTextTheme.h4),
                ],
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CitiesBottomModal();
                    },
                  );
                },
                icon: Icon(Icons.expand_more),
                splashRadius: 16,
              )
            ],
          );
        },
      ),
    );
  }
}
