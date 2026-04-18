import 'package:flutter/material.dart';

class LoyaltyCard extends StatefulWidget {
  const LoyaltyCard({
    super.key,
    this.width,
    this.height,
    this.displayText,
  });

  final double? width;
  final double? height;
  final String? displayText;

  @override
  State<LoyaltyCard> createState() => _LoyaltyCardState();
}

class _LoyaltyCardState extends State<LoyaltyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Text(
        widget.displayText ?? 'Дані відсутні',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontFamily: 'Monospace',
        ),
      ),
    );
  }
}