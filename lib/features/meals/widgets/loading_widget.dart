import 'package:flutter/material.dart';

/// A widget that displays a loading spinner (CircularProgressIndicator).
///
/// This widget is typically used to indicate that some data or content is
/// being loaded in the background.
class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      // Display a circular progress indicator in the center of the screen.
      child: CircularProgressIndicator(),
    );
  }
}
