import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<LoadDashboardData>((event, emit) async {
      emit(DashboardLoading());

      try {
        final firestore = FirebaseFirestore.instance;

        // 🔹 Fetch hotel details
        final hotelDoc = await firestore
            .collection('hotelregistration')
            .doc(event.hotelId)
            .get();

        final hotelData = hotelDoc.data();
        final hotelName = hotelData?['name'] ?? 'Unknown Hotel';

        // 🔹 Fetch bookings from hotel's subcollection
        final bookingsSnapshot = await firestore
            .collection('hotelregistration')
            .doc(event.hotelId)
            .collection('bookings')
            .get();

        final totalBookings = bookingsSnapshot.size;

        // 🔹 Calculate total revenue
        final totalRevenue = bookingsSnapshot.docs.fold<double>(
          0,
          (sum, doc) => sum + ((doc['price'] ?? 0) as num).toDouble(),
        );

        // 🔹 Fetch total rooms for this hotel
        final roomsSnapshot = await firestore
            .collection('hotelregistration')
            .doc(event.hotelId)
            .collection('rooms')
            .get();

        final totalRooms = roomsSnapshot.size;

        emit(
          DashboardLoaded(
            hotelName: hotelName,
            totalBookings: totalBookings,
            totalRooms: totalRooms,
            totalRevenue: totalRevenue,
          ),
        );
      } catch (e) {
        emit(DashboardError('Failed to load dashboard data: $e'));
      }
    });

    on<FilterRevenueEvent>((event, emit) async {
      emit(DashboardLoading());

      try {
        final firestore = FirebaseFirestore.instance;

        DateTime now = DateTime.now();
        DateTime startDate;
        DateTime endDate = now;

        switch (event.filter) {
          case "Yesterday":
            startDate = DateTime(now.year, now.month, now.day - 1);
            endDate = DateTime(now.year, now.month, now.day);
            break;

          case "This Week":
            startDate = now.subtract(Duration(days: now.weekday - 1));
            endDate = DateTime(now.year, now.month, now.day + 1);
            break;

          case "This Month":
            startDate = DateTime(now.year, now.month, 1);
            endDate = DateTime(now.year, now.month + 1, 1);
            break;

          default: // Today
            startDate = DateTime(now.year, now.month, now.day);
        }

        // ✅ Get hotel name again
        final hotelDoc = await firestore
            .collection('hotelregistration')
            .doc(event.hotelId)
            .get();
        final hotelName = hotelDoc.data()?['name'] ?? "Unknown Hotel";

        // ✅ Get total rooms (unchanged)
        final roomsSnapshot = await firestore
            .collection('hotelregistration')
            .doc(event.hotelId)
            .collection('rooms')
            .get();
        final totalRooms = roomsSnapshot.size;

        // ✅ Fetch bookings
        final bookingsSnapshot = await firestore
            .collection('hotelregistration')
            .doc(event.hotelId)
            .collection('bookings')
            .get();

        double filteredRevenue = 0.0;
        int filteredBookings = 0;

        for (var doc in bookingsSnapshot.docs) {
          final data = doc.data();
          final timestamp = data['timestamp'] as Timestamp?;
          if (timestamp == null) continue;

          final bookingDate = timestamp.toDate();

          if (bookingDate.isAtSameMomentAs(startDate) ||
              (bookingDate.isAfter(startDate) &&
                  bookingDate.isBefore(endDate))) {
            filteredRevenue += (data['price'] as num?)?.toDouble() ?? 0.0;
            filteredBookings++;
          }
        }

        emit(
          DashboardLoaded(
            hotelName: hotelName,
            totalBookings: filteredBookings,
            totalRooms: totalRooms,
            totalRevenue: filteredRevenue,
            revenueFilter: event.filter,
          ),
        );
      } catch (e) {
        emit(DashboardError("Revenue filter failed: $e"));
      }
    });
  }
}
