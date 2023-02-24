import 'package:hive_flutter/adapters.dart';

abstract class LocationLocalDatasource {
  Future<void> storeFavoriteCity(String city);
  Future<List<String>> getFavoriteCities();
}

class LocationLocalDatasourceImpl implements LocationLocalDatasource {
  @override
  Future<void> storeFavoriteCity(String city) async {
    var box = await Hive.openBox('favorite_cities');
    await box.put('cities', [city]);
    box.close();
  }

  @override
  Future<List<String>> getFavoriteCities() async {
    var box = await Hive.openBox('favorite_cities');
    List<String> cities = box.get('cities');
    return cities;
  }
}
