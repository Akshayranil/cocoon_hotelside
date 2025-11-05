import 'package:cocoon_hotelside/controller/bloc/booking/booking_bloc.dart';
import 'package:cocoon_hotelside/utilities/custom_colors.dart';
import 'package:cocoon_hotelside/view/bookings/bookings_detailed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelUid = FirebaseAuth.instance.currentUser!.uid;

    // Fetch bookings when screen opens
    context.read<BookingBloc>().add(FetchHotelBookings(hotelUid));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: BlocBuilder<BookingBloc, BookingHotelState>(
        builder: (context, state) {
          if (state is BookingHotelLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BookingHotelError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is BookingHotelLoaded) {
            final bookings = state.bookings;

            if (bookings.isEmpty) {
              return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/coccon3-removebg-preview.png', // ✅ Your image path
                  height: 150,
                ),
                const SizedBox(height: 16),
                const Text(
                  "You haven't get any bookings yet",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
             
              ],
            ),
          );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<BookingBloc>().add(FetchHotelBookings(hotelUid));
              },
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(12),
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final booking = bookings[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Booking date & ID
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Booking on: ${booking['checkInDate'] ?? ''}',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Booking ID: ${booking['roomId']}',
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Room info
                          Text(
                            '${booking['guests']} Adults • ${booking['location'] ?? 'Room'}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            booking['hotelName'] ?? '',
                            style: const TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 4),

                          // Payment info
                          Text(
                            'Payment received - ₹${booking['price'] ?? 0}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Check-in/out details
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Check-In',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(booking['checkInDate'] ?? ''),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Check-Out',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(booking['checkOutDate'] ?? ''),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Guest Info button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        GuestInfoScreen(booking: booking),
                                  ),
                                );
                              },
                              child: const Text(
                                'Guest Information',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
