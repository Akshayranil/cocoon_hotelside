part of 'dashboard_bloc.dart';

abstract class DashboardEvent {}

class LoadDashboardData extends DashboardEvent {
  final String hotelId;

  LoadDashboardData(this.hotelId);
}

class FilterRevenueEvent extends DashboardEvent {
  final String hotelId;
  final String filter;
  FilterRevenueEvent(this.hotelId, this.filter);
}

