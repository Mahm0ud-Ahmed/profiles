// profile_card.dart
import 'package:flutter/material.dart';
import 'package:profiles/config/theme/colors.dart';
import 'package:profiles/config/theme/text_styles.dart';
import '../../../data/models/profile_model.dart';
import '../../../config/theme/dimensions.dart';
import '../common/profile_avatar.dart';
import '../common/status_badge.dart';
import '../common/text_widget.dart';
import './profile_stats.dart';
import './profile_action_buttons.dart';

class ProfileCard extends StatelessWidget {
  final ProfileModel profile;
  final VoidCallback onProfileUpdated;

  const ProfileCard({
    super.key,
    required this.profile,
    required this.onProfileUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.cardMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with avatar, name, and status
              DecoratedBox(
                decoration: BoxDecoration(
                  color: profile.isCurrentlyInUse ? AppColors.secondary : AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(AppDimensions.cardMargin),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.cardMargin),
                  child: Row(
                    children: [
                      // Profile avatar
                      ProfileAvatar(avatarUrl: profile.avatarUrl),
                      const SizedBox(width: AppDimensions.paddingS),

                      // Name and SVN
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: profile.name,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.labelLarge.copyWith(
                                color: profile.isCurrentlyInUse ? AppColors.cardBackground : AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextWidget(
                              text: profile.svnNumber,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.labelMedium.copyWith(
                                color: profile.isCurrentlyInUse ? AppColors.cardBackground : AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Status badge
                      StatusBadge(status: profile.verificationStatus),
                    ],
                  ),
                ),
              ),

              if (profile.isCurrentlyInUse) const SizedBox(height: AppDimensions.paddingL),

              if (!profile.isCurrentlyInUse) Divider(),
              // Profile stats
              ProfileStats(
                connectCount: profile.connectCount,
                medicineCount: profile.medicineCount,
                consultCount: profile.consultCount,
                relationship: profile.relationship ?? '',
                constraints: constraints,
              ),

              Divider(),

              // Action buttons
              Flexible(
                child: ProfileActionButtons(
                  profile: profile,
                  onEditPressed: () {},
                  onSwitchResult: (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: TextWidget(
                          text: 'Switched to ${profile.name}\'s profile',
                          style: AppTextStyles.labelLarge.copyWith(color: AppColors.textSwitch),
                        ),
                      ),
                    );

                    // Notify parent to refresh
                    onProfileUpdated();
                    /* if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: TextWidget('Switched to ${profile.name}\'s profile'),
                          ),
                        );
                        
                        // Notify parent to refresh
                        onProfileUpdated();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: TextWidget('Failed to switch profile'),
                          ),
                        );
                      } */
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
