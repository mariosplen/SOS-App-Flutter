import 'package:flutter/material.dart';
import 'package:sos/theme/app_palette.dart';

class LocationPin extends StatelessWidget {
  const LocationPin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.location_on,
          size: 50,
          color: AppPalette.red,
          shadows: [
            BoxShadow(
              color: AppPalette.black.withOpacity(0.19),
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        Container(height: 50),
      ],
    );
  }
}
