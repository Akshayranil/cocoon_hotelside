import 'package:cocoon_hotelside/utilities/customnavigationscreen.dart';
import 'package:cocoon_hotelside/view/home/info_card.dart';
import 'package:cocoon_hotelside/view/home/revenue_filter_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cocoon_hotelside/controller/bloc/dashboard/dashboard_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  final String hotelId;

  const HomeScreen({super.key, required this.hotelId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DashboardLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<DashboardBloc>().add(LoadDashboardData(hotelId));
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _headerCard(state.hotelName),
                      const SizedBox(height: 24),
                      const Text(
                        'Dashboard Overview',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      InfoCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomNavigationscreen(
                                hotelId: hotelId,
                                tabindex: 1,
                              ),
                            ),
                          );
                        },
                        title: "Total Bookings",
                        value: state.totalBookings.toString(),
                        icon: Icons.bookmark_added,
                        color: Colors.blue,
                        gradient: LinearGradient(
                          colors: [Colors.blue.shade400, Colors.blue.shade600],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      const SizedBox(height: 16),
                      InfoCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomNavigationscreen(
                                hotelId: hotelId,
                                tabindex: 2,
                              ),
                            ),
                          );
                        },
                        title: "Total Rooms",
                        value: state.totalRooms.toString(),
                        icon: Icons.hotel,
                        color: Colors.orange,
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange.shade400,
                            Colors.orange.shade600,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      const SizedBox(height: 16),
                      InfoCard(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return RevenueFilterSheet(
                                onSelect: (filter) {
                                  Navigator.pop(context);
                                  context.read<DashboardBloc>().add(
                                    FilterRevenueEvent(hotelId, filter),
                                  );
                                },
                              );
                            },
                          );
                        },
                        title:
                            "Revenue (${state.revenueFilter})", // ✅ Dynamic label
                        value: "₹ ${state.totalRevenue.toStringAsFixed(0)}",
                        icon: Icons.currency_rupee,
                        color: Colors.green,
                        gradient: LinearGradient(
                          colors: [
                            Colors.green.shade400,
                            Colors.green.shade600,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is DashboardError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red.shade300,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _headerCard(String hotelName) {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE, d MMMM yyyy').format(now);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade400, Colors.green.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade200.withOpacity(0.5),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.waving_hand,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "Welcome Back,",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            hotelName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today, color: Colors.white70, size: 16),
              const SizedBox(width: 6),
              Text(
                formattedDate,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

 
}
