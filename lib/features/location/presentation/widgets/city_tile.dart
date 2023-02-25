import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:prayer_time/features/location/presentation/controllers/city_controller.dart';

class CityTile extends ConsumerWidget {
  final String cityName;
  final bool isFavorite;
  const CityTile({super.key, required this.cityName, required this.isFavorite});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            child: Text(cityName),
            onTap: () async {
              await setPreferredCity(cityName);
              // Close modal once a city is selected
              Navigator.pop(context);
            },
          ),
        ),
        const Spacer(),
        Opacity(
          opacity: isFavorite ? 1 : 0.5,
          child: IconButton(
            onPressed: () async {
              if (isFavorite) {
                await removeFavoriteCity(cityName);
              } else {
                await saveFavoriteCity(cityName);
              }
            },
            icon: Icon(isFavorite ? LineIcons.starAlt : LineIcons.star, size: 16),
            splashRadius: 16,
          ),
        )
      ],
    );
  }
}
