import 'package:flutter/material.dart';


/// [KeyboardFocusTracker] is a widget for closing keyboard when tapping the outside of inputs
class KeyboardFocusTracker extends StatelessWidget {
  final Widget child;
  const KeyboardFocusTracker({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => _handleTapping(context),
        child: child,
      );

  //? tracker
  void _handleTapping(BuildContext context) {
    FocusScopeNode focusScope = FocusScope.of(context);
    if (focusScope.hasPrimaryFocus == false &&
        focusScope.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
