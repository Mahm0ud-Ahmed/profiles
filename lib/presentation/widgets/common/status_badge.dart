// status_badge.dart
import 'package:flutter/material.dart';
import '../../../data/models/profile_model.dart';
import '../../../config/theme/colors.dart';
import '../../../config/theme/text_styles.dart';
import '../../../config/theme/dimensions.dart';
import 'text_widget.dart';

class StatusBadge extends StatelessWidget {
  final VerificationStatus status;

  const StatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    // Determine color and text based on status
    Color backgroundColor;
    String text = status.name;
    TextStyle textStyle;
    IconData icon;

    switch (status) {
      case VerificationStatus.verified:
        backgroundColor = AppColors.background;
        textStyle = AppTextStyles.labelMedium.copyWith(color: backgroundColor);
        icon = Icons.check_circle;
        break;
      case VerificationStatus.unverified:
        backgroundColor = AppColors.unverified;
        textStyle = AppTextStyles.labelMedium.copyWith(color: backgroundColor);
        icon = Icons.cancel;
        break;
      case VerificationStatus.pending:
        backgroundColor = AppColors.pending;
        textStyle = AppTextStyles.labelMedium.copyWith(color: backgroundColor);
        icon = Icons.update;
        break;
    }

    return Row(
      children: [
        TextWidget(
          text: text,
          style: textStyle,
        ),
        const SizedBox(width: AppDimensions.paddingXS),
        Icon(
          icon,
          size: 16,
          color: backgroundColor,
        ),
      ],
    );
  }
}
