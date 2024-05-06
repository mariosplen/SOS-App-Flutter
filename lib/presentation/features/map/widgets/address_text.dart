import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:sos/gen/fonts.gen.dart';
import 'package:sos/theme/app_palette.dart';

class AddressText extends StatelessWidget {
  const AddressText({required this.address, this.onCopy, super.key});

  final Placemark address;
  final void Function(String value)? onCopy;

  @override
  Widget build(BuildContext context) {
    final addressText =
        '${address.street ?? ''}, ${address.locality ?? ''}, ${address.postalCode ?? ''}, ${address.country ?? ''}';
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: AppPalette.white,
        border: Border.all(color: AppPalette.darkGrey, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: AppPalette.black.withOpacity(0.19),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                addressText,
                style: _locationTextStyle,
              ),
            ),
            IconButton(
              onPressed: () => onCopy!(addressText),
              icon: const Icon(
                Icons.copy_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle _locationTextStyle = const TextStyle(
  fontFamily: FontFamily.roboto,
  fontSize: 16,
  letterSpacing: 0.5,
  fontWeight: FontWeight.w400,
  color: AppPalette.darkGrey,
);
