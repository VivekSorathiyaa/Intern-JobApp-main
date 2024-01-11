import 'package:flutter/material.dart';
import 'package:saumil_s_application/core/app_export.dart';
import 'package:saumil_s_application/presentation/home_page/home_page.dart';
import 'package:saumil_s_application/presentation/message_page/message_page.dart';
import 'package:saumil_s_application/presentation/profile_page/profile_page.dart';
import 'package:saumil_s_application/presentation/saved_page/saved_page.dart';
import 'package:saumil_s_application/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class HomeContainerScreen extends StatefulWidget {
  @override
  _HomeContainerScreenState createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _getCurrentPage(_currentIndex),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        _updateCurrentPage(type);
      },
    );
  }

  /// Handling page based on index
  Widget _getCurrentPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return MessagePage();
      case 2:
        return SavedPage();
      case 3:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }

  /// Handling page index based on bottom bar click actions
  void _updateCurrentPage(BottomBarEnum type) {
    setState(() {
      switch (type) {
        case BottomBarEnum.Home:
          _currentIndex = 0;
          break;
        case BottomBarEnum.Message:
          _currentIndex = 1;
          break;
        case BottomBarEnum.Saved:
          _currentIndex = 2;
          break;
        case BottomBarEnum.Profile:
          _currentIndex = 3;
          break;
        default:
          _currentIndex = 0;
      }
    });
  }
}
