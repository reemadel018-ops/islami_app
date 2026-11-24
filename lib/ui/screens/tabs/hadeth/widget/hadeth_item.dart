import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/hadeth.dart';
import 'package:islami_app/model/hadeth_details_args.dart';
import 'package:islami_app/ui/screens/common/content_item.dart';
import 'package:islami_app/ui/screens/common/main_loading_widget.dart';

class HadethItem extends StatefulWidget {
  final int index;

  const HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.hadethDetailsRouteName,
          arguments: HadethDetailsArgs(hadeth: hadeth, index: widget.index),
        );
      },
      child: Container(
         margin: EdgeInsets.only(bottom: height * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          color: AppColors.gold,
          image: DecorationImage(
            image: AssetImage('assets/images/hadith_card_bg.png'),
          ),
        ),

        child: hadeth == null
            ? MainLoadingWidget(color: AppColors.black)
            : Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02,
                          vertical: height * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/left_corner_black.png'),
                            Image.asset('assets/images/right_corner_black.png'),
                          ],
                        ),
                      ),
                      ContentItem(
                        content: hadeth?.title ?? '',
                        style: AppStyles.bold24Black,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.04,
                        vertical: height * 0.01,
                      ),
                      child: ContentItem(
                        content: hadeth?.content ?? '',
                        style: AppStyles.bold16Black,
                      ),
                    ),
                  ),
                  Image.asset('assets/images/bottom_decoration_black.png'),
                ],
              ),
      ),
    );
  }

  void loadHadethFile() async {
    String hadethContentFile = await rootBundle.loadString(
      'assets/files/hadeth/h${widget.index}.txt',
    );
    int newLineIndex = hadethContentFile.indexOf('\n');
    String title = hadethContentFile.substring(0, newLineIndex);
    String content = hadethContentFile.substring(newLineIndex + 1);

    if (!mounted) return;
    hadeth = Hadeth(title: title, content: content);
    setState(() {});
  }
}
