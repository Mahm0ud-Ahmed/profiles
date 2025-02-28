// profile.dart
class ProfileModel {
  final String id;
  final String name;
  final String svnNumber;
  final String? relationship;
  final String avatarUrl;
  final VerificationStatus verificationStatus;
  final int connectCount;
  final int medicineCount;
  final int consultCount;
  final bool isCurrentlyInUse;

  const ProfileModel({
    required this.id,
    required this.name,
    required this.svnNumber,
    this.relationship,
    required this.avatarUrl,
    required this.verificationStatus,
    required this.connectCount,
    required this.medicineCount,
    required this.consultCount,
    this.isCurrentlyInUse = false,
  });

  // Handy method to check if profile is verified
  bool get isVerified => verificationStatus == VerificationStatus.verified;
  
  // Handy method to check if profile is pending
  bool get isPending => verificationStatus == VerificationStatus.pending;
}

// Enum to represent the verification status
enum VerificationStatus {
  verified,
  unverified,
  pending,
}

// For the UI icons/stats
class ProfileStat {
  final String label;
  final int count;
  final String iconName; // This would represent icon assets or icon data

  ProfileStat({
    required this.label,
    required this.count,
    required this.iconName,
  });
}