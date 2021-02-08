import 'package:blocbuster/common/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({Key key, @required this.height})
      : assert(height != null, 'height must not be null'),
        assert(height > 0, 'height must be greater than zero'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/logo.png',
      color: Colors.white,
      height: height.h,
    );
  }
}
