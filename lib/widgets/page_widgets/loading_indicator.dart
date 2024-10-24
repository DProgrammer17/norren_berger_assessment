import 'package:flutter/material.dart';
import 'package:norrenberger_assesment/constants/app_colors.dart';

class LoadingIndicatorOverlay extends StatelessWidget {
  final bool isLoading;

  const LoadingIndicatorOverlay({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        if (isLoading)
          ModalBarrier(
            color: AppColors.secondaryColor
                .withOpacity(0.2), // Adjust the opacity as needed
            dismissible: false,
          ),
        if (isLoading)
          const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primaryColor,
            ),
          ),
      ],
    );
  }
}
