import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sos/blocs/settings/settings_bloc.dart';
import 'package:sos/gen/assets.gen.dart';
import 'package:sos/gen/translations/locale_keys.g.dart';
import 'package:sos/lib/presentation/features/text_styles.dart';
import 'package:sos/presentation/features/home/widgets/home_button.dart';
import 'package:sos/presentation/features/home/widgets/terms_modal.dart';
import 'package:sos/presentation/shared/custom_icon_button.dart';
import 'package:sos/theme/app_palette.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final settingsBloc = context.read<SettingsBloc>();
        final isTermsAccepted = settingsBloc.state.termsAccepted;

        return Stack(
          children: [
            Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: AppPalette.transparent,
                actions: [
                  CustomIconButton(
                    onPressed: () => context.push('/settings'),
                    color: AppPalette.white,
                  ),
                ],
              ),
              body: Stack(
                children: [
                  Assets.lib.assets.images.bgTop.image(
                    width: double.infinity,
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 36, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 50),
                          Column(
                            children: [
                              Image.asset(
                                'lib/assets/images/wave.png',
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                LocaleKeys.welcome.tr(),
                                style: AppTextStyles.titleStyleBlack,
                              ),
                            ],
                          ),
                          const SizedBox(height: 100),
                          HomeButton(
                            text: LocaleKeys.emergency_numbers.tr(),
                            onPressed: () => context.push('/countries'),
                            icon: Assets.lib.assets.images.call,
                          ),
                          const SizedBox(height: 20),
                          HomeButton(
                            text: LocaleKeys.share_location.tr(),
                            onPressed: () => context.push('/map'),
                            icon: Assets.lib.assets.images.location,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (!isTermsAccepted) _buildTermsDialogOverlay(context),
          ],
        );
      },
    );
  }

  Container _buildTermsDialogOverlay(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: TermsModal(
        onAccept: () {
          context.read<SettingsBloc>().add(const ChangeTerms(true));
        },
        onTermsTap: () => context.push("/settings/terms"),
      ),
    );
  }
}
