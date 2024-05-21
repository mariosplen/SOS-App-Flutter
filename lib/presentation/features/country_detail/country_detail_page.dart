import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sos/blocs/country_detail/country_detail_bloc.dart';
import 'package:sos/gen/assets.gen.dart';
import 'package:sos/models/country_model.dart';
import 'package:sos/presentation/features/country_detail/widgets/dispatch_button.dart';
import 'package:sos/presentation/features/country_detail/widgets/phone_button.dart';
import 'package:sos/presentation/shared/alert_snackbar.dart';
import 'package:sos/presentation/shared/loading_page.dart';
import 'package:sos/presentation/shared/custom_icon_button.dart';

class CountryDetailPage extends StatelessWidget {
  const CountryDetailPage({
    this.country,
    required this.countries,
    super.key,
  });

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
              appBar: AppBar(
                title: Text(state.country?.name ?? 'Country'),
                actions: [
                  CustomIconButton(
                    onPressed: () => context.push('/settings'),
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    _buildDispatchButton(state.country!),
                    _buildPhonesSection(state.country!),
                    ElevatedButton(
                        onPressed: () => context.push('/map'),
                        child: Text("Show location on map")),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

// UI Sections
_buildDispatchButton(Country country) {
  if (country.dispatch.isEmpty) {
    return const SizedBox.shrink();
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 70.0),
    child: DispatchButton(country.dispatch),
  );
}

_buildPhonesSection(Country country) {
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
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 9.5),
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
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 9.5),
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
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 9.5),
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
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 9.5),
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

_buildPhoneTile(String title, List<String> phones) {
  return Row(
    children: [
      Text(title),
      Column(
        children: List.generate(
          phones.length,
          (index) => Text(phones[index]),
        ),
      ),
    ],
  );
}
