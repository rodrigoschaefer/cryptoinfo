
import 'package:cryptoinfo/utils/size_utils.dart';
import 'package:flutter/material.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: SizeUtils.verticalBlockSize*5,),
            const AssetInfo(name: 'Cardano',price: 0.56,symbol: 'ADA',currency: 'USD', thumbImageUrl: 'https://assets.coingecko.com/coins/images/975/thumb/cardano.png?1547034860'),
            const AssetInfo(name: 'Solana',price: 0.26,symbol: 'SOL',currency: 'USD', thumbImageUrl: 'https://assets.coingecko.com/coins/images/4128/thumb/solana.png?1640133422'),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
