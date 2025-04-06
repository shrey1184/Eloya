import 'package:flutter/material.dart';
import '../constants/colours.dart';

class SocialLoginButton extends StatelessWidget {
  final bool isFacebook;
  final VoidCallback onPressed;

  const SocialLoginButton({
    Key? key,
    required this.isFacebook,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isFacebook ? AppColors.facebookBlue : AppColors.googleRed,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isFacebook ? Icons.facebook : Icons.g_mobiledata,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
