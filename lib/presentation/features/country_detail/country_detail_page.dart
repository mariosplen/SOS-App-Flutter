import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sos/blocs/country_detail/country_detail_bloc.dart';
import 'package:sos/models/country_model.dart';
import 'package:sos/presentation/features/country_detail/widgets/dispatch_button.dart';
import 'package:sos/presentation/shared/alert_snackbar.dart';
import 'package:sos/presentation/shared/loading_page.dart';

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

  final countriesDispatchNumbers = country.dispatch;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 100.0),
    child: DispatchButton(countriesDispatchNumbers),
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
      if (country.ambulance.isNotEmpty)
        _buildPhoneTile('Ambulance', country.ambulance),
      if (country.fire.isNotEmpty) //
        _buildPhoneTile('Fire', country.fire),
      if (country.police.isNotEmpty) _buildPhoneTile('Police', country.police),
      if (country.traffic.isNotEmpty)
        _buildPhoneTile('Traffic', country.traffic),
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
