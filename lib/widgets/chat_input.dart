import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 322,
      height: 34,
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: AppColors.borderColor.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.public, color: AppColors.primary),
            onPressed: () {},
            iconSize: 24,
            padding: const EdgeInsets.all(5),
          ),
          IconButton(
            icon: Icon(Icons.attachment, color: AppColors.primary),
            onPressed: () {},
            iconSize: 24,
            padding: const EdgeInsets.all(5),
          ),
          Expanded(
            child: Text(
              'Type something',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFFDBC9F2),
                letterSpacing: 0.193,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
