import 'package:cryptoinfo/utils/size_utils.dart';
import 'package:cryptoinfo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../search/presentation/components/search_asset_dialog_content.dart';
import '../../../search/presentation/cubit/crypto_search_cubit.dart';
import '../cubit/crypto_records_cubit.dart';
import '../widgets/asset_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CryptoRecordsCubit, CryptoRecordsCubitState>(
          bloc: BlocProvider.of<CryptoRecordsCubit>(context),
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: SizeUtils.verticalBlockSize * 5,
                  ),
                  ListView.builder(
                    itemCount: state.assetList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return AssetInfo(
                        name: state.assetList[index].name,
                        price: state.assetList[index].price,
                        symbol: state.assetList[index].symbol,
                        thumbImageUrl: state.assetList[index].thumbImageUrl,
                        currency: state.assetList[index].currency,
                      );
                    },
                  )
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Utils.showAlertContent(
              context: context,
              title: const SearchAssetDialogContent(),
              insetPadding:
                  EdgeInsets.only(bottom: SizeUtils.verticalBlockSize * 30));
        },
        tooltip: 'Search',
        child: const Icon(Icons.add),
      ),
    );
  }
}
