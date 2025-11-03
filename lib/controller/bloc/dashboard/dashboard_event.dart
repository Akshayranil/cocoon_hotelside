part of 'dashboard_bloc.dart';

abstract class DashboardEvent {}

class LoadDashboardData extends DashboardEvent {
  final String hotelId;

  LoadDashboardData(this.hotelId);
}

enum RevenueFilter { today, week, month, all }

class FilterRevenue extends DashboardEvent {
  final RevenueFilter filter;
  final String hotelId;

  FilterRevenue(this.filter, this.hotelId);
}

