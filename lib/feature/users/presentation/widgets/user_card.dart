import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      child: Padding(
        padding: const EdgeInsets.all(14),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                CircleAvatar(child: Text(user.name[0])),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      Text('@${user.username}'),
                    ],
                  ),
                ),
              ],
            ),

            const Divider(),

            Text('Email: ${user.email}'),

            Text('Phone: ${user.phone}'),

            Text('Website: ${user.website}'),

            const SizedBox(height: 10),

            const Text(
              'Address',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Text(
              '${user.address.street}, '
              '${user.address.suite}',
            ),

            Text(
              '${user.address.city}, '
              '${user.address.zipcode}',
            ),

            Text('Latitude: ${user.address.geo.lat}'),

            Text('Longitude: ${user.address.geo.lng}'),

            const SizedBox(height: 10),

            const Text(
              'Company',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Text(user.company.name),

            Text(user.company.catchPhrase),
          ],
        ),
      ),
    );
  }
}
