import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchAssetDialogContent extends StatefulWidget{
  const SearchAssetDialogContent({Key? key}) : super(key: key);

  @override
  State<SearchAssetDialogContent> createState() => _SearchAssetDialogContentState();
}

class _SearchAssetDialogContentState extends State<SearchAssetDialogContent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
          autofocus: true,
          style: DefaultTextStyle.of(context).style.copyWith(
              fontStyle: FontStyle.italic
          ),
          decoration: const InputDecoration(
              border: OutlineInputBorder()
          )
      ),
      suggestionsCallback: (pattern) async {
        return ['test'];
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: Text('nada'),
          subtitle: const Text('\$suggestion'),
        );
      },
      onSuggestionSelected: (suggestion) {

      },
    );
  }
}
