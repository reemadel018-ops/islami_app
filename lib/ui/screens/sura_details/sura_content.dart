import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class SuraContent extends StatelessWidget {
  final String content;
  

  const SuraContent({super.key,
  required this.content,
  });

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.04),
      child: Text(content,
      style: AppStyles.bold20gold,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,),
    );
  }
}
