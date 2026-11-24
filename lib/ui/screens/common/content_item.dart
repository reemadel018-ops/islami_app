import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class ContentItem extends StatelessWidget {
  final String content;
  final double? horizontalPadding;
  final TextStyle? style;

  const ContentItem({super.key, required this.content, this.horizontalPadding,
  this.style});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    // var height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? width * 0.04,
      ),
      child: Text(
        content,
        style:style?? AppStyles.bold20gold,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }
}
