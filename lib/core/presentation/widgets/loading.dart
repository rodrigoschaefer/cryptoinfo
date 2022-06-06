
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../utils/size_utils.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0.6),
      child: Center(
        child: SpinKitThreeBounce(
          color: Theme.of(context).colorScheme.secondary,
          size: SizeUtils.horizontalBlockSize * 7,
        ),
      ),
    );
  }
}