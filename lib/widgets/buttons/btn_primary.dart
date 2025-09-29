import 'package:flutter/material.dart';

class BtnPrimary extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? hoverColor;
  final Color? textColor;
  final BorderRadius? borderRadius;

  const BtnPrimary({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
    this.backgroundColor,
    this.hoverColor,
    this.textColor,
    this.borderRadius,
  });

  @override
  State<BtnPrimary> createState() => _BtnPrimaryState();
}

class _BtnPrimaryState extends State<BtnPrimary> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bgColor =
        widget.backgroundColor ?? Theme.of(context).colorScheme.inversePrimary;
    final hoverBg =
        widget.hoverColor ?? bgColor.withAlpha((0.85 * 255).round());
    final radius = widget.borderRadius ?? BorderRadius.circular(50);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: widget.height ?? 40,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
          color: _isHovered ? hoverBg : bgColor,
          borderRadius: radius,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: radius,
            onTap: widget.onPressed,
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  color: widget.textColor ?? Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
