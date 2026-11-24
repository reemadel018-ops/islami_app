import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/hadeth_details_args.dart';
import 'package:islami_app/ui/screens/common/content_item.dart';

class HadethDetailsScreen extends StatefulWidget {
  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethDetailsArgs;

    var width = context.width;
    var height = context.height;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text('Hadeth ${args.index}', style: AppStyles.bold20gold),
      ),
      body: Column(
        spacing: height * 0.02,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/img_left_corner.png'),

                    Image.asset('assets/images/img_right_corner.png'),
                  ],
                ),
                Text(args.hadeth!.title, style: AppStyles.bold24gold),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ContentItem(content: args.hadeth!.content),
            ),
          ),

          Image.asset('assets/images/img_bottom_decoration.png'),
        ],
      ),
    );
  }
}
