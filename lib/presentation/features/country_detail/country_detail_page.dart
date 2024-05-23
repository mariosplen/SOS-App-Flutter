import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sos/blocs/country_detail/country_detail_bloc.dart';
import 'package:sos/gen/assets.gen.dart';
import 'package:sos/models/country_model.dart';
import 'package:sos/presentation/features/country_detail/widgets/dispatch_button.dart';
import 'package:sos/presentation/features/country_detail/widgets/phone_button.dart';
import 'package:sos/presentation/shared/alert_snackbar.dart';
import 'package:sos/presentation/shared/loading_page.dart';
import 'package:sos/presentation/shared/custom_icon_button.dart';
import 'package:go_router/go_router.dart';
import 'package:sos/lib/presentation/features/text_styles.dart';

class CountryDetailPage extends StatelessWidget {
  // ignore: use_super_parameters
  const CountryDetailPage({
    required this.country,
    required this.countries,
    Key? key,
  }) : super(key: key);

  final Country? country;
  final List<Country> countries;

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
                    expandedHeight: 200.0,
                    iconTheme: const IconThemeData(color: Colors.white),
                    backgroundColor: Colors.transparent,
                    flexibleSpace: Stack(
                      children: [
                        Positioned.fill(
                          child: Assets.lib.assets.images.countryDetail.image(
                            fit: BoxFit.cover,
                          ),
                        ),
                        FlexibleSpaceBar(
                          titlePadding:
                              const EdgeInsets.only(left: 50, bottom: 70),
                          title: Text(
                            state.country?.name ?? 'Country',
                            style: AppTextStyles.titleStyleWhite
                                .copyWith(fontSize: 16),
                          ),
                        ),
                      ],
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
                        ElevatedButton(
                          onPressed: () => context.push('/map'),
                          child: const Text("Show location on map"),
                        ),
                        const SizedBox(height: 55),
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
}

// UI Sections
Widget _buildDispatchButton(Country country) {
  if (country.dispatch.isEmpty) {
    return const SizedBox.shrink();
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 70.0),
    child: DispatchButton(country.dispatch),
  );
}

Widget _buildPhonesSection(Country country) {
  if (country.ambulance.isEmpty &&
      country.fire.isEmpty &&
      country.police.isEmpty &&
      country.traffic.isEmpty) {
    return const SizedBox.shrink();
  }

  return Column(
    children: [
      if (country.police.isNotEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 9.5),
          child: PhoneButton(
            title: 'Police',
            color: const Color(0xFF5E9DE7),
            numbers: country.police,
            onPressed: () {},
            icon: Assets.lib.assets.images.police,
          ),
        ),
      if (country.ambulance.isNotEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 9.5),
          child: PhoneButton(
            title: 'Ambulance',
            color: const Color(0xFF76cc57),
            numbers: country.ambulance,
            onPressed: () {},
            icon: Assets.lib.assets.images.ambulance,
          ),
        ),
      if (country.fire.isNotEmpty) //
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 9.5),
          child: PhoneButton(
            title: 'Fire',
            color: const Color(0xFFF0AC5D),
            numbers: country.fire,
            onPressed: () {},
            icon: Assets.lib.assets.images.fire,
          ),
        ),
      if (country.traffic.isNotEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 9.5),
          child: PhoneButton(
            title: 'Traffic',
            color: const Color(0xFF76cc57),
            numbers: country.traffic,
            onPressed: () {},
            icon: Assets.lib.assets.images.ambulance,
          ),
        ),
    ],
  );
}
