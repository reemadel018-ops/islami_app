import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_color.dart';

class MainLoadingWidget extends StatelessWidget {
  const MainLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.gold,
      ),
    );
  }
}