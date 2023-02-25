import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:prayer_time/features/location/data/cities.dart';

import 'package:prayer_time/features/location/presentation/controllers/city_controller.dart';
import 'package:prayer_time/features/location/presentation/widgets/city_tile.dart';
import 'package:prayer_time/features/location/presentation/widgets/location_menu.dart';

class CitiesBottomModal extends ConsumerWidget {
  const CitiesBottomModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Either<Failure, List<String>>> favoriteCities = ref.watch(favoriteCitiesProvider);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Search cities'),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: Hive.box('favorite_cities').listenable(),
          builder: (BuildContext context, Box<dynamic> value, Widget? child) {
            List<String> favoriteCitiesList = value.get('cities') ?? [];
            return Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                scrollDirection: Axis.vertical,
                children: [
                  ...favoriteCitiesList
                      .map((cityName) => CityTile(
                            cityName: cityName,
                            isFavorite: favoriteCitiesList.contains(cityName),
                          ))
                      .toList(),
                  ...cities
                      .where((element) => !favoriteCitiesList.contains(element))
                      .map((cityName) => CityTile(
                            cityName: cityName,
                            isFavorite: favoriteCitiesList.contains(cityName),
                          ))
                      .toList(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
