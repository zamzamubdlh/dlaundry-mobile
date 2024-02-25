import 'package:dlaundry_mobile/config/app_constants.dart';
import 'package:dlaundry_mobile/providers/dashboard_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (_, wiRef, __) {
          int navIndex = wiRef.watch(dashboardNavIndexProvider);

          return AppConstants.navMenuDashboard[navIndex]['view'] as Widget;
        },
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(70, 0, 70, 20),
        child: Consumer(builder: (_, wiRef, __) {
          int navIndex = wiRef.watch(dashboardNavIndexProvider);

          if (kDebugMode) print(navIndex);

          return Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            elevation: 8,
            child: BottomNavigationBar(
              currentIndex: navIndex,
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconSize: 30,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                wiRef.read(dashboardNavIndexProvider.notifier).state = value;
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.grey[400],
              items: AppConstants.navMenuDashboard.map((e) {
                return BottomNavigationBarItem(
                  icon: Icon(e['icon']),
                  label: e['label'],
                );
              }).toList(),
            ),
          );
        }),
      ),
    );
  }
}
