import 'package:flutter/material.dart';

class BtnSecondaryWidget extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final double height;

  const BtnSecondaryWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 3, horizontal: 70),
    this.height = 40,
  });

  @override
  State<BtnSecondaryWidget> createState() => _BtnSecondaryWidgetState();
}

class _BtnSecondaryWidgetState extends State<BtnSecondaryWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.primaryContainer;
    final textColor = Theme.of(context).colorScheme.inversePrimary;
    final hoverBg = Theme.of(context).colorScheme.secondaryContainer;
    final radius = BorderRadius.circular(50);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Material(
        color: Colors.transparent,
        borderRadius: radius,
        child: InkWell(
          borderRadius: radius,
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            height: widget.height,
            padding: widget.padding,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _isHovered ? hoverBg : bgColor,
              borderRadius: radius,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromRGBO(0, 0, 0, 0.15),
                  blurRadius: 3,
                  spreadRadius: 0,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
