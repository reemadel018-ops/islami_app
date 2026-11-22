import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_color.dart';

class MainLoadingWidget extends StatelessWidget {
  final Color? color;
  const MainLoadingWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color:color?? AppColors.gold));
  }
}
