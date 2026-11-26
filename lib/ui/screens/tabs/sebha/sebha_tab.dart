import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:islami_app/core/utils/app_size_utils.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/providers/sebha_provider.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    final sebha = context.watch<SebhaProvider>();
    final width = context.width;
    final height = context.height;
    final circleSize = width * 0.88;

    return Center(
      child: Column(
        children: [
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأَعْلَى',
            textAlign: TextAlign.center,
            style: AppStyles.bold30White,
          ),
          SizedBox(height: height * 0.04),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.07),
                child: GestureDetector(
                  onTap: () => context.read<SebhaProvider>().increment(),
                  child: SizedBox(
                    width: circleSize,
                    height: circleSize,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedRotation(
                          turns: sebha.turns,
                          duration: const Duration(milliseconds: 250),
                          child: Image.asset(
                            'assets/images/sebha_body.png',
                            width: circleSize,
                            height: circleSize,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(sebha.currentZekr, style: AppStyles.bold30White),
                            SizedBox(height: height * 0.018),
                            Text('${sebha.counter}', style: AppStyles.bold30White),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Image.asset('assets/images/sebha_head.png', height: height * 0.08),
            ],
          ),
        ],
      ),
    );
  }
}