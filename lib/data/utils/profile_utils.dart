// profile_utils.dart (in data/utils/ folder)
import '../models/profile_model.dart';

class ProfileUtils {
  // Generate stats for UI display from a profile
  static List<ProfileStat> generateStatsFromProfile(ProfileModel profile) {
    return [
      ProfileStat(
        label: profile.relationship == 'Me' ? 'Connect' : '',
        count: profile.connectCount,
        iconName: 'connect_icon', // This would be the asset name or icon data
      ),
      ProfileStat(
        label: 'Medicine',
        count: profile.medicineCount,
        iconName: 'medicine_icon',
      ),
      ProfileStat(
        label: 'Consult',
        count: profile.consultCount,
        iconName: 'consult_icon',
      ),
    ];
  }
  
  // Get status text based on verification status
  static String getStatusText(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.verified:
        return 'Verified';
      case VerificationStatus.unverified:
        return 'unverified';
      case VerificationStatus.pending:
        return 'Pending';
    }
  }
}