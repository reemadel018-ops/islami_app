import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/ui/screens/tabs/quran/widgets/most_recent_widget.dart';
import 'package:islami_app/ui/screens/tabs/quran/widgets/sura_item.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterlist = List.generate(114, ((index) => index));

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        spacing: height * 0.02,
        children: [
          _buildSearchSection(),
          MostRecentWidget(),
          Text('Suras List', style: AppStyles.bold16White),
          _buildSuraListSection(
            onSuraItemClick: (index) {
              Navigator.of(context)
                  .pushNamed(AppRoutes.suraDetailsRouteName, arguments: index);
            },
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _builtDecorationBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 2, color: AppColors.gold),
    );
  }

  Widget _buildSearchSection() {
    return TextField(
      style: AppStyles.bold16White,

      cursorColor: AppColors.gold,
      decoration: InputDecoration(
        enabledBorder: _builtDecorationBorder(),
        focusedBorder: _builtDecorationBorder(),
        hintText: 'Sura Name',
        hintStyle: AppStyles.bold14White,

        prefixIcon: Image.asset('assets/images/search_icon.png'),
      ),
      onChanged: (text) {
        searchBySuraName(text);
      },
    );
  }

  Widget _buildSuraListSection({required void Function(int) onSuraItemClick}) {
    return Expanded(
      child:
      filterlist.isEmpty?
     Center(
      child: Text('No Sura Name Found',
      style: AppStyles.bold20gold,),

      ):
      ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onSuraItemClick(filterlist[index]);
            },
            child: SuraItem(index: filterlist[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 1,
            height: context.height * 0.04,
            color: AppColors.white,
            endIndent: context.width * 0.06,
            indent: context.width * 0.06,
          );
        },
        itemCount: filterlist.length,
      ),
    );
  }

  void searchBySuraName(String suraName) {
    List<int> searchList = [];
    for (int i = 0; i < QuranResources.englishQuranSuraList.length; i++) {
      if (QuranResources.englishQuranSuraList[i].toLowerCase().contains(suraName) ||
          QuranResources.arabicQuranSuraList[i].contains(suraName.toLowerCase())) {
        searchList.add(i);
      }
      filterlist = searchList;
      setState(() {
        
      });
    }
  }
}
