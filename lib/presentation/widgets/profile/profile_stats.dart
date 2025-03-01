// profile_stats.dart
import 'package:flutter/material.dart';
import 'package:profiles/config/assets/assets.gen.dart';
import 'package:profiles/config/theme/colors.dart';
import 'package:profiles/presentation/widgets/common/image_widget.dart';
import '../../../config/theme/text_styles.dart';
import '../../../config/theme/dimensions.dart';
import '../common/text_widget.dart';

class ProfileStats extends StatelessWidget {
  final int connectCount;
  final int medicineCount;
  final int consultCount;
  final String relationship;
  final BoxConstraints constraints;

  const ProfileStats({
    super.key,
    required this.connectCount,
    required this.medicineCount,
    required this.consultCount,
    required this.relationship,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: constraints.maxWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatItem(
              context,
              Assets.diversity1,
              null,
              relationship,
            ),
            
            if (connectCount > 0)
              _buildStatItem(
                context,
                Assets.connectWithoutContact,
                connectCount.toString(),
                'Connect',
              ),
            
            // Medicine stat
            _buildStatItem(
              context,
              Assets.medication,
              medicineCount.toString(),
              'Medicine',
            ),
            
            // Consult stat
            _buildStatItem(
              context,
              Assets.consult,
              consultCount.toString(),
              'Consult',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    SvgGenImage icon,
    String? count,
    String label,
  ) {
    return Row(
      children: [
        ImageWidget(
          image: icon,
          width: 18,
          height: 18,
          svgColor: AppColors.primary,
        ),
        const SizedBox(width: AppDimensions.paddingXS),
        if (count != null) ...[
          TextWidget(
            text: count,
            style: AppTextStyles.labelSmall,
          ),
          const SizedBox(width: AppDimensions.paddingXS),
        ],
        TextWidget(
          text: label,
          style: AppTextStyles.labelSmall,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
