import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_resources.dart';

class SuraItem extends StatelessWidget {
  final int index;
  const SuraItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Row(
      spacing: width*0.04,
      children: [
        Stack(
          alignment:Alignment.center,
          children: [
            Image.asset('assets/images/vector.png'),
            Text('${index+1}',
            style: AppStyles.bold14White,)
            ]
            ),
        Column(
          spacing: height*0.01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(QuranResources.englishQuranSuraList[index],
            style: AppStyles.bold20White,),
             Text('${QuranResources.versesNumbersList[index]}  Verses',
            style: AppStyles.bold14White,)
          ],
    
        ),
        Spacer(),
        Text(QuranResources.arabicQuranSuraList[index],
            style: AppStyles.bold20White,)
      ],
    );
  }
}
