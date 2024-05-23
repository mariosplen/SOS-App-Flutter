import 'package:flutter/material.dart';
import 'package:sos/lib/presentation/features/text_styles.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    required this.icon,
    required this.title,
    this.selectedValue,
    this.onTap,
    super.key,
  });
  final Widget icon;
  final String title;
  final String? selectedValue;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(title, style: AppTextStyles.settingsTitleStyle),
      trailing: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(selectedValue ?? '', style: AppTextStyles.settingsDescStyle),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
