import 'package:equatable/equatable.dart';

class FavoriteLocation extends Equatable {
  final String cityName;

  FavoriteLocation({required this.cityName});

  @override
  List<Object?> get props => [cityName];
}
