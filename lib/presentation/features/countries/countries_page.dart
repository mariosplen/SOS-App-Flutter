import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sos/blocs/countries/countries_bloc.dart';
import 'package:sos/gen/fonts.gen.dart';
import 'package:sos/models/country_model.dart';
import 'package:sos/presentation/features/countries/widgets/country_tile.dart';
import 'package:sos/presentation/features/countries/widgets/or_separator.dart';
import 'package:sos/presentation/features/countries/widgets/search_field.dart';
import 'package:sos/presentation/features/countries/widgets/use_location_button.dart';
import 'package:sos/presentation/shared/loading_indicator.dart';
import 'package:sos/theme/app_palette.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesBloc()..add(const LoadCountries()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Select Country',
            style: _titleStyle,
          ),
          actions: [
            IconButton(
              onPressed: () => context.push('/settings'),
              icon: const Icon(Icons.settings),
            ),
          ],
          scrolledUnderElevation: 0,
        ),
        body: SafeArea(
          child: BlocBuilder<CountriesBloc, CountriesState>(
            builder: (context, state) {
              if (state.countries.isEmpty) {
                return const Center(child: LoadingIndicator());
              } else {
                final bloc = context.read<CountriesBloc>();
                final countries = state.countries;
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(
                    children: [
                      SearchField(onSearch: (query) => bloc.add(Search(query))),
                      const SizedBox(height: 16),
                      _buildExpandedListView(countries),
                      const OrSeparator(),
                      UseLocationButton(
                        countries: countries,
                        onTap: () => context.push(
                          '/country-detail',
                          extra: {'countries': countries},
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Expanded _buildExpandedListView(List<Country> countries) {
    return Expanded(
      child: ListView.separated(
        itemCount: countries.length,
        separatorBuilder: (context, index) => const Divider(
          height: 0.5,
          color: AppPalette.lightGrey,
        ),
        itemBuilder: (context, index) {
          final country = countries[index];
          return CountryTile(
            country: country,
            onCountryTap: (country) => context.push(
              '/country-detail',
              extra: {'country': country},
            ),
          );
        },
      ),
    );
  }
}

TextStyle _titleStyle = const TextStyle(
  fontFamily: FontFamily.roboto,
  fontSize: 20,
  fontWeight: FontWeight.w600,
  height: 20 / 16,
  letterSpacing: 0.5,
  color: AppPalette.black,
);
