// ProfileModel_repository.dart
import '../models/profile_model.dart';

class ProfileRepository {
  // Singleton pattern to ensure we only have one instance
  static final ProfileRepository _instance = ProfileRepository._internal();

  factory ProfileRepository() {
    return _instance;
  }

  ProfileRepository._internal();

  // In a real app, this would fetch from an API
  // For this task, we'll use static data
  List<ProfileModel> getProfileModels() {
    return [
      ProfileModel(
        id: '1',
        name: 'Matthew Brian',
        svnNumber: 'SVN:123 456 789',
        relationship: 'Me',
        avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
        verificationStatus: VerificationStatus.verified,
        connectCount: 2,
        medicineCount: 11,
        consultCount: 2,
        isCurrentlyInUse: true,
      ),
      ProfileModel(
        id: '2',
        name: 'Matthew Brian',
        svnNumber: 'SVN:123 456 789',
        relationship: 'My Father',
        avatarUrl: 'https://randomuser.me/api/portraits/men/21.jpg',
        verificationStatus: VerificationStatus.unverified,
        connectCount: 0,
        medicineCount: 5,
        consultCount: 0,
        isCurrentlyInUse: false,
      ),
      ProfileModel(
        id: '3',
        name: 'Erica Jason',
        svnNumber: 'SVN:123 456 789',
        relationship: 'My mother',
        avatarUrl: 'https://randomuser.me/api/portraits/women/3.jpg',
        verificationStatus: VerificationStatus.pending,
        connectCount: 0,
        medicineCount: 9,
        consultCount: 3,
        isCurrentlyInUse: false,
      ),
    ];
  }

  // Method to get the currently active ProfileModel
  ProfileModel? getCurrentProfileModel() {
    final ProfileModels = getProfileModels();
    try {
      return ProfileModels.firstWhere((ProfileModel) => ProfileModel.isCurrentlyInUse);
    } catch (e) {
      // If no ProfileModel is currently in use, return null or the first ProfileModel
      return ProfileModels.isNotEmpty ? ProfileModels.first : null;
    }
  }

  // Get ProfileModel by ID
  ProfileModel? getProfileModelById(String id) {
    final ProfileModels = getProfileModels();
    try {
      return ProfileModels.firstWhere((ProfileModel) => ProfileModel.id == id);
    } catch (e) {
      return null;
    }
  }

  // Method to simulate switching to a different profile with UI feedback
  ProfileModel switchToProfile(String profileId) {
    // Get all profiles
    final List<ProfileModel> profiles = getProfileModels();

    // Find the target profile
    return profiles.firstWhere(
      (profile) => profile.id == profileId,
      orElse: () => profiles.first,
    );
  }
}
