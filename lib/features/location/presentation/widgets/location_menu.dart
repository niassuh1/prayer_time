import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:prayer_time/core/error/failure.dart';
import 'package:prayer_time/features/location/presentation/controllers/location_menu_controller.dart';

class LocationMenu extends ConsumerWidget {
  const LocationMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Either<Failure, Placemark>> location = ref.watch(locationMenuProvider);
    return Center(
        child: location.when(
      data: (location) => Text(location.fold((l) => 'Failure', (r) => r.administrativeArea!)),
      error: (err, stack) => Text('Error'),
      loading: () => Text('Loading...'),
    ));
  }
}
