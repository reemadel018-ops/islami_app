import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class MostRecentWidget extends StatelessWidget {
  const MostRecentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: height * 0.01,
      children: [
        Text('Most Recent', style: AppStyles.bold16White),
        SizedBox(
          height: height * 0.18,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, inedex) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.circular(20),

                ),
                padding: EdgeInsets.symmetric(
                  horizontal: width*0.04
                ),
                child: Row(
                  spacing: width*0.02,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Al-Anbiya',
                        style: AppStyles.bold24Black,),

                        Text('الانبياء',
                        style: AppStyles.bold24Black,),

                        Text('112 verses',
                        style: AppStyles.bold14Black,),
                      ],
                    
                    ),
                    Image.asset('assets/images/most_recent.png')

                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: width * 0.04);
            },
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
