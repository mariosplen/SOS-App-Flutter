import 'package:flutter/material.dart';
import 'package:sos/gen/fonts.gen.dart';
import 'package:sos/theme/app_palette.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    required this.onSearch,
    super.key,
  });

  final void Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: _searchInputDecoration,
      onChanged: onSearch,
    );
  }
}

InputDecoration _searchInputDecoration = InputDecoration(
  hintText: 'Search',
  prefixIcon: const Icon(Icons.search),
  contentPadding: const EdgeInsets.all(0),
  hintStyle: _searchTextStyle,
  labelStyle: _searchTextStyle.copyWith(color: AppPalette.black),
  focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(color: AppPalette.grey),
  ),
  enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(color: AppPalette.lightGrey),
  ),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(),
  ),
);

TextStyle _searchTextStyle = const TextStyle(
  fontFamily: FontFamily.roboto,
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: AppPalette.darkGrey,
);
