import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/ui/screens/common/main_loading_widget.dart';
import 'package:islami_app/ui/screens/common/content_item.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String verses='';
  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context)?.settings.arguments as int? ?? 0;
    
    loadSuraFile(index);
    var width = context.width;
    var height = context.height;


    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranSuraList[index],
          style: AppStyles.bold20gold,
        ),
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
                Text(
                  QuranResources.arabicQuranSuraList[index],
                  style: AppStyles.bold24gold,
                ),
              ],
            ),
          ),
          Expanded(child:verses.isEmpty?
          MainLoadingWidget()
          :
          SingleChildScrollView(
            child: ContentItem(content: verses,
            ),
          )),

          Image.asset('assets/images/img_bottom_decoration.png'),
        ],
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[ ${i+1} ]';
    }
    verses= lines.join(' ');
    setState(() {
      
    });
  }
}
