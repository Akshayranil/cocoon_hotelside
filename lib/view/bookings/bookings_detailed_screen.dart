import 'package:flutter/material.dart';

class GuestInfoScreen extends StatelessWidget {
  final Map<String, dynamic> booking;
  const GuestInfoScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Guest Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Guest Information',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 12),
                Text('Booking ID: ${booking['roomId'] ?? ''}',
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Text('Booked by: ${booking['userName'] ?? 'Unknown'}'),
                Text('No. of guests: ${booking['guests'] ?? 0}'),
                Text('Room Booked: ${booking['location'] ?? ''}'),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Check-In',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(booking['checkInDate'] ?? ''),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Check-Out',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(booking['checkOutDate'] ?? ''),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
