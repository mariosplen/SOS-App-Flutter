import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sos/blocs/countries/countries_bloc.dart';
import 'package:sos/gen/translations/locale_keys.g.dart';
import 'package:sos/lib/presentation/features/text_styles.dart';
import 'package:sos/models/country_model.dart';
import 'package:sos/presentation/features/countries/widgets/country_tile.dart';
import 'package:sos/presentation/features/countries/widgets/or_separator.dart';
import 'package:sos/presentation/features/countries/widgets/search_field.dart';
import 'package:sos/presentation/features/countries/widgets/use_location_button.dart';
import 'package:sos/presentation/shared/custom_icon_button.dart';
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
          backgroundColor: Colors.transparent,
          title: Text(
            LocaleKeys.select_country.tr(),
            style: AppTextStyles.titleStyleBlack,
          ),
          actions: [
            CustomIconButton(
              onPressed: () => context.push('/settings'),
              color: const Color.fromARGB(255, 0, 0, 0),
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
                final countries = bloc.getShownCountries();
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(
                    children: [
                      SearchField(
                        key: const Key('search_field'),
                        onSearch: (query) => bloc.add(Search(query)),
                      ),
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
