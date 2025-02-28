import 'package:flutter/material.dart';
import 'package:profiles/config/theme/text_styles.dart';
import 'package:profiles/presentation/widgets/common/image_widget.dart';
import '../../../config/assets/assets.gen.dart';
import '../../../data/models/profile_model.dart';
import '../../../data/repositories/profile_repository.dart';
import '../../../config/theme/colors.dart';
import '../../../config/theme/dimensions.dart';
import '../../widgets/common/text_widget.dart';
import '../../widgets/profile/profile_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late List<ProfileModel> _profiles;
  final ProfileRepository _repository = ProfileRepository();

  @override
  void initState() {
    super.initState();
    _loadProfiles();
  }

  void _loadProfiles() {
    setState(() {
      _profiles = _repository.getProfileModels();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const TextWidget(text: 'Profiles', style: AppTextStyles.heading),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppDimensions.paddingM),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: Size(84, AppDimensions.buttonHeight),
                maximumSize: Size(84, AppDimensions.buttonHeight),
                padding: EdgeInsets.zero,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add),
                  Flexible(
                    child: TextWidget(
                      text: 'Add new',
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingM),
        itemCount: _profiles.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 420,
        // mainAxisExtent: _calculateHeight(context),
        mainAxisExtent: 190,
      ),
        itemBuilder: (context, index) {
          return ProfileCard(
            profile: _profiles[index],
            onProfileUpdated: _loadProfiles,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Profiles tab is selected
        items: const [
          BottomNavigationBarItem(
            icon: ImageWidget(image: Assets.medication),
            label: 'Medication',
          ),
          BottomNavigationBarItem(
            icon: ImageWidget(image: Assets.consult),
            label: 'Consult',
          ),
          BottomNavigationBarItem(
            icon: ImageWidget(image: Assets.variant3),
            label: 'add',
          ),
          BottomNavigationBarItem(
            icon: ImageWidget(image: Assets.profiles),
            label: 'Profiles',
          ),
          BottomNavigationBarItem(
            icon: ImageWidget(image: Assets.more),
            label: 'more',
          ),
        ],
      ),
    );
  }
}
