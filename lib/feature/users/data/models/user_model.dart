import '../../domain/entities/user.dart';
import 'address_model.dart';
import 'company_model.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.address,
    required super.phone,
    required super.website,
    required super.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      address: AddressModel.fromJson(
        Map<String, dynamic>.from(json['address'] ?? {}),
      ),
      phone: json['phone'] ?? '',
      website: json['website'] ?? '',
      company: CompanyModel.fromJson(
        Map<String, dynamic>.from(json['company'] ?? {}),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': AddressModel(
        street: address.street,
        suite: address.suite,
        city: address.city,
        zipcode: address.zipcode,
        geo: address.geo,
      ).toJson(),
      'phone': phone,
      'website': website,
      'company': CompanyModel(
        name: company.name,
        catchPhrase: company.catchPhrase,
        bs: company.bs,
      ).toJson(),
    };
  }
}
