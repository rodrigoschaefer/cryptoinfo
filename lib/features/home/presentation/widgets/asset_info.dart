import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptoinfo/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'crypto_thumb.dart';

class AssetInfo extends StatelessWidget {
  final String? thumbImageUrl;
  final String name;
  final String symbol;
  final double price;
  final String currency;

  const AssetInfo(
      {required this.name,
      this.currency = 'USD',
      required this.price,
      required this.symbol,
      this.thumbImageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeUtils.verticalBlockSize * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            CryptoThumb(url: thumbImageUrl!),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: TextStyle(fontSize: SizeUtils.horizontalBlockSize*3.5 ),),
                SizedBox(height: SizeUtils.verticalBlockSize,),
                Text(symbol),
              ],
            ),
          ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(price.toString()),
            SizedBox(width: SizeUtils.horizontalBlockSize,),
            Text(currency,style: TextStyle(fontSize: SizeUtils.horizontalBlockSize*2.5 ),textAlign: TextAlign.end),
          ])
        ],
      ),
    );
  }
}
