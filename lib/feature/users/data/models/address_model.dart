import '../../domain/entities/address.dart';
import 'geo_model.dart';

class AddressModel extends Address {
  const AddressModel({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'] ?? '',
      suite: json['suite'] ?? '',
      city: json['city'] ?? '',
      zipcode: json['zipcode'] ?? '',
      geo: GeoModel.fromJson(
        Map<String, dynamic>.from(json['geo'] ?? {}),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': {
        'lat': geo.lat,
        'lng': geo.lng,
      },
    };
  }
}
