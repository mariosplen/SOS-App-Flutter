import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:sos/blocs/map/map_bloc.dart';
import 'package:sos/gen/fonts.gen.dart';
import 'package:sos/gen/translations/locale_keys.g.dart';
import 'package:sos/presentation/features/map/widgets/address_text.dart';
import 'package:sos/presentation/features/map/widgets/location_pin.dart';
import 'package:sos/presentation/shared/alert_snackbar.dart';
import 'package:sos/presentation/shared/custom_icon_button.dart';
import 'package:sos/presentation/shared/loading_page.dart';
import 'package:sos/theme/app_palette.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MapPage extends StatelessWidget {
  const MapPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc()..add(const GetLocation()),
      child: BlocConsumer<MapBloc, MapState>(
        listener: (context, state) {
          if (state.appException != null) {
            showAlertSnackbar(context, state.appException!.type);
            context.pop();
          }
          if (state.copied) {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                message: LocaleKeys.location_copied.tr(),
              ),
            );
          }
        },
        builder: (context, state) {
          var gotLocation = state.location != null &&
              state.address != null &&
              state.appException == null;

          if (!gotLocation) {
            return const LoadingPage();
          }
          final bloc = BlocProvider.of<MapBloc>(context);
          return Stack(
            children: [
              Stack(
                children: [
                  FlutterMap(
                    options: MapOptions(
                      interactionOptions: const InteractionOptions(
                        flags: InteractiveFlag.none,
                        enableScrollWheel: false,
                        enableMultiFingerGestureRace: false,
                      ),
                      initialCenter: state.location!,
                      initialZoom: 16.5,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.github.mariosplen.sos',
                      ),
                    ],
                  ),
                  const Center(
                    child: LocationPin(),
                  ),
                ],
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  actions: [
                    CustomIconButton(
                      onPressed: () => context.push('/settings'),
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AddressText(
                          address: state.address!,
                          onCopy: (value) => bloc.add(CopyPressed(value)),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => bloc.add(const SharePressed()),
                          style: _elevatedButtonStyle,
                          icon:
                              const Icon(Icons.share, color: AppPalette.white),
                          label: Text(
                            LocaleKeys.share.tr().toUpperCase(),
                            style: _buttonTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

ButtonStyle _elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: AppPalette.primary,
  minimumSize: const Size(double.infinity, 50),
  padding: const EdgeInsets.symmetric(horizontal: 17),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
);

TextStyle _buttonTextStyle = const TextStyle(
  fontFamily: FontFamily.roboto,
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: AppPalette.white,
);
