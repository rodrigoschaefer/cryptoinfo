import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../core/data/model/coin_model.dart';
import '../../../../injection.dart';
import '../../../../utils/size_utils.dart';
import '../../../home/presentation/widgets/crypto_thumb.dart';
import '../cubit/crypto_search_cubit.dart';

class SearchAssetDialogContent extends StatefulWidget {
  const SearchAssetDialogContent({Key? key}) : super(key: key);

  @override
  State<SearchAssetDialogContent> createState() =>
      _SearchAssetDialogContentState();
}

class _SearchAssetDialogContentState extends State<SearchAssetDialogContent> {
  late CryptoSearchCubit _cryptoSearchCubit;

  @override
  void initState() {
    _cryptoSearchCubit = getIt<CryptoSearchCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Search asset',
            style: TextStyle(fontSize: SizeUtils.horizontalBlockSize * 4)),
        const SizedBox(
          height: 10,
        ),
        TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
              autofocus: true,
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontStyle: FontStyle.italic),
              decoration: const InputDecoration(border: OutlineInputBorder())),
          itemBuilder: (context, suggestion) {
            suggestion as CoinModel;
            return ListTile(
              leading: CryptoThumb(url: suggestion.thumb),
              title: Text(suggestion.name),
              subtitle: Text(suggestion.symbol),
            );
          },
          suggestionsCallback: (String pattern) async {
            if (pattern.length >= 3) {
              var result = await _cryptoSearchCubit.searchCryptoAssetSync(
                  partial: pattern);
              if (result != null) {
                return result;
              }
            }
            return [];
          },
          debounceDuration: const Duration(milliseconds: 500),
          onSuggestionSelected: (suggestion) {},
        )
      ],
    ));
  }
}
