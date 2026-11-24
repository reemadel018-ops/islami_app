import 'package:carousel_slider/carousel_slider.dart';
import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/ui/screens/tabs/hadeth/widget/hadeth_item.dart';

class HadethTab extends StatelessWidget {
  HadethTab({super.key});
  final List<int> itemsIndex = List.generate(50, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return CarouselSlider(
      options: CarouselOptions(height: height*0.65,
      enlargeCenterPage: true
      ),
      
      items: itemsIndex.map((index) => HadethItem(index: index)).toList(),
    );
  }
}
