import 'package:flutter/material.dart';

typedef OnRetryPressed = void Function();

class RetryButton extends StatelessWidget {
  const RetryButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final OnRetryPressed onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text('Retry'),
    );
  }
}
