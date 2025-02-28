// profile_action_buttons.dart
import 'package:flutter/material.dart';
import '../../../data/models/profile_model.dart';
import '../../../data/repositories/profile_repository.dart';
import '../../../config/theme/colors.dart';
import '../../../config/theme/text_styles.dart';
import '../../../config/theme/dimensions.dart';
import '../common/text_widget.dart';

class ProfileActionButtons extends StatelessWidget {
  final ProfileModel profile;
  final VoidCallback onEditPressed;
  final Function(ProfileModel) onSwitchResult;

  const ProfileActionButtons({
    super.key,
    required this.profile,
    required this.onEditPressed,
    required this.onSwitchResult,
  });

  @override
  Widget build(BuildContext context) {
    if (profile.isCurrentlyInUse) {
      return Row(
        children: [
          // Connection button
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                // Handle connection action
              },
              child: TextWidget(
                text: 'Connection',
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary),
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.paddingM),

          // Edit button
          Expanded(
            child: ElevatedButton(
              onPressed: onEditPressed,
              child: TextWidget(
                text: 'Edit',
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary),
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.paddingM),

          // Currently use indicator
          Expanded(
            child: Container(
              height: AppDimensions.buttonHeight,
              decoration: BoxDecoration(
                color: AppColors.currentlyUseBackground,
                borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
              ),
              child: Center(
                child: TextWidget(
                  text: 'Currently use',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.labelLarge.copyWith(color: AppColors.secondary),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          // Edit button
          Expanded(
            child: ElevatedButton(
              onPressed: onEditPressed,
              child: TextWidget(
                text: 'Edit',
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary),
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.paddingM),

          // Switch profile button
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Call repository method
                final success = ProfileRepository().switchToProfile(profile.id);

                // Notify parent about result
                onSwitchResult(success);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
              ),
              child: TextWidget(
                text: 'Switch Profile',
                style: AppTextStyles.labelLarge.copyWith(color: AppColors.textSwitch),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      );
    }
  }
}
