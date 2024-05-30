import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sos/blocs/country_detail/country_detail_bloc.dart';
import 'package:sos/gen/assets.gen.dart';
import 'package:sos/gen/translations/locale_keys.g.dart';
import 'package:sos/lib/presentation/features/text_styles.dart';
import 'package:sos/models/country_model.dart';
import 'package:sos/presentation/features/country_detail/widgets/dispatch_button.dart';
import 'package:sos/presentation/features/country_detail/widgets/phone_button.dart';
import 'package:sos/presentation/shared/alert_snackbar.dart';
import 'package:sos/presentation/shared/custom_icon_button.dart';
import 'package:sos/presentation/shared/loading_page.dart';
import 'package:url_launcher/url_launcher.dart';

class CountryDetailPage extends StatelessWidget {
  const CountryDetailPage({
    required this.country,
    required this.countries,
    super.key,
  });

  final Country? country;
  final List<Country> countries;

  Future<void> _copyToClipboardAndOpenDialer(String phoneNumber) async {
    // Copy the phone number to the clipboard
    Clipboard.setData(ClipboardData(text: phoneNumber));
    // Open the phone dialer app
    final Uri dialerUri = Uri(
      scheme: 'tel',
      path: Uri.encodeComponent(phoneNumber),
    );
    if (await canLaunch(dialerUri.toString())) {
      await launch(dialerUri.toString());
    } else {
      debugPrint('Could not launch phone dialer for $phoneNumber');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryDetailBloc>(
      create: (context) {
        final bloc = CountryDetailBloc();
        if (country == null) {
          bloc.add(CountryFromLocationEvent(countries));
        } else {
          bloc.add(SetCountryEvent(country!));
        }
        return bloc;
      },
      child: BlocConsumer<CountryDetailBloc, CountryDetailState>(
        listener: (BuildContext context, state) {
          if (state.appException != null) {
            showAlertSnackbar(context, state.appException!.type);
            context.pop();
          }
        },
        builder: (BuildContext context, state) {
          if (state.country == null) {
            return const LoadingPage();
          } else {
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    centerTitle: false,
                    expandedHeight: 138.0,
                    iconTheme: const IconThemeData(color: Colors.white),
                    backgroundColor: Colors.transparent,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Assets.lib.assets.images.countryDetails2.image(
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: const BoxDecoration(),
                          ),
                        ],
                      ),
                      titlePadding: const EdgeInsets.only(left: 50, bottom: 16),
                      title: Text(
                        state.country?.name ?? LocaleKeys.country.tr(),
                        style: AppTextStyles.titleStyleWhite
                            .copyWith(fontSize: 16),
                      ),
                    ),
                    actions: [
                      CustomIconButton(
                        onPressed: () => context.push('/settings'),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        _buildDispatchButton(state.country!),
                        _buildPhonesSection(state.country!),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9.5,
                            vertical: 10.0,
                          ),
                          child: ElevatedButton(
                            onPressed: () => context.push('/map'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 255, 255, 255),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  side: const BorderSide(
                                    color: Color.fromARGB(255, 46, 46, 46),
                                    width: 1,
                                  ),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size(500.0, 50.0),
                              ),
                            ),
                            child: Text(
                              LocaleKeys.show_location_on_map.tr(),
                              style: AppTextStyles.buttonStyle,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDispatchButton(Country country) {
    if (country.dispatch.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 70.0, right: 70.0),
      child: DispatchButton(
        [country.dispatch.first], //display first number
        AppTextStyles.dispatchButtonStyle,
        onPressed: () => _copyToClipboardAndOpenDialer(country.dispatch.first),
      ),
    );
  }

  Widget _buildPhonesSection(Country country) {
    if (country.ambulance.isEmpty &&
        country.fire.isEmpty &&
        country.police.isEmpty &&
        country.traffic.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0), //top padding police
      child: Column(
        children: [
          if (country.police.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 9.5),
              child: PhoneButton(
                title: LocaleKeys.police.tr(),
                color: const Color(0xFF5E9DE7),
                numbers: [country.police.first], //display only the first number
                onPressed: () =>
                    _copyToClipboardAndOpenDialer(country.police.first),
                icon: Assets.lib.assets.images.police,
              ),
            ),
          if (country.ambulance.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 9.5),
              child: PhoneButton(
                title: LocaleKeys.ambulance.tr(),
                color: const Color(0xFF76cc57),
                numbers: [
                  country.ambulance.first,
                ], //display only the first number
                onPressed: () =>
                    _copyToClipboardAndOpenDialer(country.ambulance.first),
                icon: Assets.lib.assets.images.ambulance,
              ),
            ),
          if (country.fire.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 9.5),
              child: PhoneButton(
                title: LocaleKeys.fire.tr(),
                color: const Color(0xFFF0AC5D),
                numbers: [country.fire.first], //display only the first number
                onPressed: () =>
                    _copyToClipboardAndOpenDialer(country.fire.first),
                icon: Assets.lib.assets.images.fire,
              ),
            ),
          if (country.traffic.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 9.5),
              child: PhoneButton(
                title: LocaleKeys.traffic.tr(),
                color: Color.fromARGB(255, 224, 173, 210),
                numbers: [
                  country.traffic.first,
                ], //display only the first number
                onPressed: () =>
                    _copyToClipboardAndOpenDialer(country.traffic.first),
                icon: Assets.lib.assets.images.traffic,
              ),
            ),
        ],
      ),
    );
  }
}
