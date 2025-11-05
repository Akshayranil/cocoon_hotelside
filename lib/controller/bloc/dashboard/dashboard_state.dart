part of 'dashboard_bloc.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final String hotelName;
  final int totalBookings;
  final int totalRooms;
  final double totalRevenue;
  final String revenueFilter;

  DashboardLoaded({
    required this.hotelName,
    required this.totalBookings,
    required this.totalRooms,
    required this.totalRevenue,
    this.revenueFilter = "Today"
  });
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError(this.message);
}
