import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sos/blocs/settings/settings_bloc.dart';
import 'package:sos/gen/assets.gen.dart';
import 'package:sos/presentation/features/home/terms_modal.dart';
import 'package:sos/presentation/features/home/widgets/home_button.dart';
import 'package:sos/presentation/shared/re_text.dart';
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
                  IconButton(
                    onPressed: () => context.push('/settings'),
                    icon: const Icon(
                      Icons.settings,
                      color: AppPalette.white,
                    ),
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
                              Container(
                                color: Colors.yellow,
                                height: 100,
                                width: 100,
                              ),
                              const ReText(
                                'Welcome',
                              ),
                            ],
                          ),
                          const SizedBox(height: 100),
                          HomeButton(
                            text: "Emergency Numbers",
                            onPressed: () => context.push('/countries'),
                            icon: Assets.lib.assets.images.call,
                          ),
                          const SizedBox(height: 20),
                          HomeButton(
                            text: "Share My Location",
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
        onTermsTap: () => context.push('/terms'),
      ),
    );
  }
}
