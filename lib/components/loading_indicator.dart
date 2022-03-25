import 'dart:ui';

import 'package:flutter/material.dart';

/// A simple centered circular progress indicator
///
/// {@category Components}
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
