import 'package:flutter/material.dart';
import '../constants/colours.dart';

class CustomInputField extends StatelessWidget {
  final String? initialValue;
  final bool isPassword;
  final VoidCallback? onToggleVisibility;
  final bool obscureText;

  const CustomInputField({
    Key? key,
    this.initialValue,
    this.isPassword = false,
    this.onToggleVisibility,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
      ),
      child: isPassword
          ? Row(
              children: [
                Expanded(
                  child: Row(
                    children: List.generate(
                      8,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.5),
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            color: AppColors.textSecondary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.textSecondary,
                    size: 20,
                  ),
                  onPressed: onToggleVisibility,
                ),
              ],
            )
          : TextField(
              controller: TextEditingController(text: initialValue),
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
    );
  }
}
