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

        emit(DashboardLoaded(
          hotelName: hotelName,
          totalBookings: totalBookings,
          totalRooms: totalRooms,
          totalRevenue: totalRevenue,
        ));
      } catch (e) {
        emit(DashboardError('Failed to load dashboard data: $e'));
      }
    });
  }
}
