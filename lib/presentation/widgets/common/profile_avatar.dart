// profile_avatar.dart
import 'package:flutter/material.dart';
import '../../../config/theme/dimensions.dart';

class ProfileAvatar extends StatelessWidget {
  final String avatarUrl;
  final double size;

  const ProfileAvatar({
    super.key,
    required this.avatarUrl,
    this.size = AppDimensions.avatarSizeMedium,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: Image.network(
          avatarUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Fallback for when image doesn't load
            return Container(
              color: Colors.grey[300],
              child: Icon(
                Icons.person,
                size: size * 0.6,
                color: Colors.grey[600],
              ),
            );
          },
        ),
      ),
    );
  }
}
