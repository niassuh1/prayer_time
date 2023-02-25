import 'package:hive_flutter/adapters.dart';
import 'package:prayer_time/core/local_hive_boxes.dart';

abstract class LocationLocalDatasource {
  Future<void> storeFavoriteCity(String city);
  Future<List<String>> getFavoriteCities();
  Future<void> removeFavoriteCity(String city);
  Future<void> setPreferredCity(String city);
  Future<String?> getPreferredCity();
}

class LocationLocalDatasourceImpl implements LocationLocalDatasource {
  @override
  Future<void> storeFavoriteCity(String city) async {
    var box = Hive.box(LocalHiveBoxes.FAVORITE_CITIES);
    List<String> cities = box.get('cities') ?? [];
    if (!cities.contains(city)) {
      cities.add(city);
    }
    await box.put('cities', cities);
  }

  @override
  Future<List<String>> getFavoriteCities() async {
    var box = Hive.box(LocalHiveBoxes.FAVORITE_CITIES);
    List<String> cities = box.get('cities') ?? [];

    return cities;
  }

  @override
  Future<void> removeFavoriteCity(String city) async {
    var box = Hive.box(LocalHiveBoxes.FAVORITE_CITIES);
    List<String> cities = box.get('cities');
    cities.remove(city);
    await box.put('cities', cities);
  }

  @override
  Future<void> setPreferredCity(String city) async {
    var box = await Hive.openBox(LocalHiveBoxes.PREFERRED_CITY);
    await box.put('city', city);
  }

  @override
  Future<String?> getPreferredCity() async {
    var box = await Hive.openBox(LocalHiveBoxes.PREFERRED_CITY);
    String? city = box.get('city');
    return city;
  }
}
