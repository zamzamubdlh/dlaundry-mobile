import 'package:dlaundry_mobile/pages/dashboard_views/account_view.dart';
import 'package:dlaundry_mobile/pages/dashboard_views/home_view.dart';
import 'package:dlaundry_mobile/pages/dashboard_views/my_laundry_view.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const appName = 'D Laundry';

  static const _host = 'http://127.0.1:8000';

  static const baseURL = '$_host/api';

  static const baseImageURL = '$_host/storage';

  static const laundryStatusCategory = ['All', 'Pickup', 'Queue', 'Process', 'Washing', 'Dried', 'Ironed', 'Done', 'Delivery'];

  static List<Map> navMenuDashboard = [
    {
      'view': const HomeView(),
      'icon': Icons.home_filled,
      'label': 'Home',
    },
    {
      'view': const MyLaundryView(),
      'icon': Icons.local_laundry_service,
      'label': 'My Laundry',
    },
    {
      'view': const AccountView(),
      'icon': Icons.account_circle,
      'label': 'Account',
    }
  ];

  static const homeCategories = ['All', 'Regular', 'Express', 'Economical', 'Exclusive'];
}
